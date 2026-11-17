using System;
using System.Collections.Generic;
using System.Linq;
using UniInject;
using UniInject.Extensions;
using UniRx;
using UnityEngine;
using UnityEngine.UIElements;

public class PlayerControl : MonoBehaviour, INeedInjection, IInjectionFinishedListener
{
	public class EnterSentenceEvent
	{
		public Sentence Sentence { get; private set; }

		public int SentenceIndex { get; private set; }

		public EnterSentenceEvent(Sentence sentence, int sentenceIndex)
		{
			Sentence = sentence;
			SentenceIndex = sentenceIndex;
		}
	}

	[Inject(Key = "playerUi")]
	private VisualTreeAsset playerUi;

	private readonly Subject<EnterSentenceEvent> enterSentenceEventStream = new Subject<EnterSentenceEvent>();

	[Inject]
	private Injector injector;

	private Injector childrenInjector;

	[Inject]
	private SongMeta songMeta;

	private int displaySentenceIndex;

	[Inject(SearchMethod = SearchMethods.GetComponentInChildren)]
	public PlayerNoteRecorder PlayerNoteRecorder { get; private set; }

	[Inject(SearchMethod = SearchMethods.GetComponentInChildren)]
	public PlayerMicPitchTracker PlayerMicPitchTracker { get; private set; }

	[Inject(SearchMethod = SearchMethods.GetComponentInChildren)]
	public MicSampleRecorder MicSampleRecorder { get; private set; }

	[Inject(SearchMethod = SearchMethods.GetComponentInChildren)]
	public PlayerScoreControl PlayerScoreControl { get; private set; }

	[Inject]
	public PlayerProfile PlayerProfile { get; private set; }

	[Inject(Optional = true)]
	public MicProfile MicProfile { get; private set; }

	[Inject]
	public Voice Voice { get; private set; }

	public IObservable<EnterSentenceEvent> EnterSentenceEventStream => enterSentenceEventStream;

	public List<Sentence> SortedSentences { get; private set; } = new List<Sentence>();

	public PlayerUiControl PlayerUiControl { get; private set; }

	public void OnInjectionFinished()
	{
		PlayerUiControl = new PlayerUiControl();
		childrenInjector = CreateChildrenInjectorWithAdditionalBindings();
		SortedSentences = Voice.Sentences.ToList();
		SortedSentences.Sort(Sentence.comparerByStartBeat);
		VisualElement instance = playerUi.CloneTree().Children().First();
		Injector obj = UniInjectUtils.CreateInjector(childrenInjector);
		obj.AddBindingForInstance("rootVisualElement", instance);
		obj.AddBindingForInstance(obj);
		obj.Inject(PlayerUiControl);
		INeedInjection[] componentsInChildren = base.gameObject.GetComponentsInChildren<INeedInjection>(includeInactive: true);
		foreach (INeedInjection needInjection in componentsInChildren)
		{
			if (!(needInjection is PlayerControl))
			{
				childrenInjector.Inject(needInjection);
			}
		}
		SetDisplaySentenceIndex(0);
	}

	public void UpdateUi()
	{
		PlayerUiControl.Update();
	}

	private Injector CreateChildrenInjectorWithAdditionalBindings()
	{
		Injector obj = UniInjectUtils.CreateInjector(injector);
		obj.AddBindingForInstance(MicSampleRecorder);
		obj.AddBindingForInstance(PlayerMicPitchTracker);
		obj.AddBindingForInstance(PlayerNoteRecorder);
		obj.AddBindingForInstance(PlayerScoreControl);
		obj.AddBindingForInstance(PlayerUiControl);
		obj.AddBindingForInstance(obj);
		obj.AddBindingForInstance(this);
		return obj;
	}

	public void SetCurrentBeat(double currentBeat)
	{
		if (displaySentenceIndex < SortedSentences.Count && currentBeat >= (double)GetDisplaySentence().LinebreakBeat)
		{
			Sentence upcomingSentenceForBeat = GetUpcomingSentenceForBeat(currentBeat);
			int num = SortedSentences.IndexOf(upcomingSentenceForBeat);
			if (num >= 0)
			{
				SetDisplaySentenceIndex(num);
			}
		}
	}

	private void SetDisplaySentenceIndex(int newValue)
	{
		displaySentenceIndex = newValue;
		Sentence sentence = GetSentence(displaySentenceIndex);
		enterSentenceEventStream.OnNext(new EnterSentenceEvent(sentence, displaySentenceIndex));
	}

	public Sentence GetSentence(int index)
	{
		if (index < 0 || index >= SortedSentences.Count)
		{
			return null;
		}
		return SortedSentences[index];
	}

	public Note GetNextSingableNote(double currentBeat)
	{
		return (from note in SortedSentences.SelectMany((Sentence sentence) => sentence.Notes)
			where !note.IsFreestyle
			where currentBeat <= (double)note.StartBeat
			orderby note.StartBeat
			select note).FirstOrDefault();
	}

	private Sentence GetUpcomingSentenceForBeat(double currentBeat)
	{
		return Voice.Sentences.FirstOrDefault((Sentence sentence) => currentBeat < (double)sentence.LinebreakBeat);
	}

	public Sentence GetDisplaySentence()
	{
		return GetSentence(displaySentenceIndex);
	}

	public Note GetLastNoteInSong()
	{
		if (SortedSentences.IsNullOrEmpty())
		{
			return null;
		}
		return SortedSentences.Last().Notes.OrderBy((Note note) => note.EndBeat).Last();
	}
}
