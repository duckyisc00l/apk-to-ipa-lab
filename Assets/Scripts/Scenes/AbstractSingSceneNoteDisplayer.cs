using System.Collections.Generic;
using System.Linq;
using UniInject;
using UniInject.Extensions;
using UniRx;
using UnityEngine;
using UnityEngine.UIElements;

public abstract class AbstractSingSceneNoteDisplayer : INeedInjection, IInjectionFinishedListener
{
	[Inject(Key = "perfectEffectStarUi")]
	protected VisualTreeAsset perfectEffectStarUi;

	[Inject(Key = "noteUi")]
	protected VisualTreeAsset noteUi;

	[Inject(UxmlName = "targetNoteEntryContainer")]
	protected VisualElement targetNoteEntryContainer;

	[Inject(UxmlName = "recordedNoteEntryContainer")]
	protected VisualElement recordedNoteEntryContainer;

	[Inject(UxmlName = "effectsContainer")]
	protected VisualElement effectsContainer;

	[Inject]
	protected Settings settings;

	[Inject]
	protected SongMeta songMeta;

	[Inject]
	protected PlayerNoteRecorder playerNoteRecorder;

	[Inject]
	protected SingSceneControl singSceneControl;

	[Inject]
	protected Injector injector;

	[Inject(Optional = true)]
	protected MicProfile micProfile;

	protected LineDisplayer lineDisplayer;

	protected double beatsPerSecond;

	protected readonly Dictionary<Note, TargetNoteControl> noteToTargetNoteControl = new Dictionary<Note, TargetNoteControl>();

	protected readonly Dictionary<RecordedNote, List<RecordedNoteControl>> recordedNoteToRecordedNoteControlsMap = new Dictionary<RecordedNote, List<RecordedNoteControl>>();

	protected readonly List<StarParticleControl> starControls = new List<StarParticleControl>();

	protected int avgMidiNote;

	protected int noteRowCount;

	protected float[] noteRowToYPercent;

	protected int maxNoteRowMidiNote;

	protected int minNoteRowMidiNote;

	protected float noteHeightPercent;

	private bool displayRoundedAndActualRecordedNotes;

	private bool showPitchOfNotes;

	protected abstract void UpdateNotePosition(VisualElement visualElement, int midiNote, double noteStartBeat, double noteEndBeat);

	public virtual void OnInjectionFinished()
	{
		targetNoteEntryContainer.Clear();
		recordedNoteEntryContainer.Clear();
		effectsContainer.Clear();
		beatsPerSecond = BpmUtils.GetBeatsPerSecond(songMeta);
		playerNoteRecorder.RecordedNoteStartedEventStream.Subscribe((PlayerNoteRecorder.RecordedNoteStartedEvent recordedNoteStartedEvent) =>
		{
			DisplayRecordedNote(recordedNoteStartedEvent.RecordedNote);
		});
		playerNoteRecorder.RecordedNoteContinuedEventStream.Subscribe((PlayerNoteRecorder.RecordedNoteContinuedEvent recordedNoteContinuedEvent) =>
		{
			DisplayRecordedNote(recordedNoteContinuedEvent.RecordedNote);
		});
		lineDisplayer = new LineDisplayer();
		lineDisplayer.LineColor = Color.grey;
		injector.Inject(lineDisplayer);
	}

	public virtual void Update()
	{
		noteToTargetNoteControl.Values.ForEach((TargetNoteControl targetNoteControl) =>
		{
			UpdateTargetNoteControl(targetNoteControl);
		});
		recordedNoteToRecordedNoteControlsMap.Values.ForEach((List<RecordedNoteControl> recordedNoteControls) =>
		{
			recordedNoteControls.ForEach((RecordedNoteControl recordedNoteControl) =>
			{
				UpdateRecordedNoteControl(recordedNoteControl);
			});
		});
		starControls.ForEach((StarParticleControl starControl) =>
		{
			starControl.Update();
		});
	}

	protected virtual void UpdateTargetNoteControl(TargetNoteControl targetNoteControl)
	{
		targetNoteControl.Update();
	}

	protected virtual void UpdateRecordedNoteControl(RecordedNoteControl recordedNoteControl)
	{
		recordedNoteControl.Update();
		if (recordedNoteControl.EndBeat < (double)recordedNoteControl.TargetEndBeat)
		{
			UpdateRecordedNoteControlEndBeat(recordedNoteControl);
			UpdateNotePosition(recordedNoteControl.VisualElement, recordedNoteControl.MidiNote, recordedNoteControl.StartBeat, recordedNoteControl.EndBeat);
		}
	}

	public void SetLineCount(int lineCount)
	{
		if (lineDisplayer == null)
		{
			return;
		}
		noteRowCount = lineCount * 2 - 3;
		if (noteRowCount < 12)
		{
			throw new UnityException(GetType()?.ToString() + " must be initialized with a row count >= 12 (one row for each note in an octave)");
		}
		noteRowToYPercent = new float[noteRowCount];
		float num = 1f / (float)lineCount;
		noteHeightPercent = num / 2f;
		float num2 = noteHeightPercent;
		float num3 = noteHeightPercent;
		float num4 = 1f - num2 - num3;
		for (int i = 0; i < noteRowCount; i++)
		{
			noteRowToYPercent[i] = 1f - (num2 + num4 * (float)i / (float)noteRowCount);
		}
		List<float> list = new List<float>();
		for (int j = 0; j < noteRowToYPercent.Length; j++)
		{
			if (j % 2 == 0)
			{
				list.Add(noteRowToYPercent[j]);
			}
		}
		lineDisplayer.DrawLines(list.ToArray());
	}

	public void RemoveAllDisplayedNotes()
	{
		RemoveTargetNotes();
		RemoveRecordedNotes();
	}

	protected virtual void DisplayRecordedNote(RecordedNote recordedNote)
	{
		if (recordedNote.TargetNote != null && recordedNote.TargetNote.IsFreestyle)
		{
			return;
		}
		if (recordedNoteToRecordedNoteControlsMap.TryGetValue(recordedNote, out var value))
		{
			foreach (RecordedNoteControl item in value)
			{
				item.TargetEndBeat = recordedNote.EndBeat;
			}
			return;
		}
		CreateRecordedNoteControl(recordedNote, useRoundedMidiNote: true);
		if (displayRoundedAndActualRecordedNotes && recordedNote.RecordedMidiNote != recordedNote.RoundedMidiNote)
		{
			CreateRecordedNoteControl(recordedNote, useRoundedMidiNote: false);
		}
	}

	protected virtual TargetNoteControl CreateTargetNoteControl(Note note)
	{
		if (note.StartBeat == note.EndBeat)
		{
			return null;
		}
		VisualElement visualElement = noteUi.CloneTree().Children().First();
		TargetNoteControl targetNoteControl = injector.WithBindingForInstance(note).WithRootVisualElement(visualElement).CreateAndInject<TargetNoteControl>();
		Label label = targetNoteControl.Label;
		string absoluteName = MidiUtils.GetAbsoluteName(note.MidiNote);
		if (settings.GraphicSettings.showLyricsOnNotes && showPitchOfNotes)
		{
			label.text = GetDisplayText(note) + " (" + absoluteName + ")";
		}
		else if (settings.GraphicSettings.showLyricsOnNotes)
		{
			label.text = GetDisplayText(note);
		}
		else if (showPitchOfNotes)
		{
			label.text = absoluteName;
		}
		else
		{
			label.text = "";
		}
		label.RegisterCallbackOneShot((GeometryChangedEvent evt) =>
		{
			UpdateNoteLabelFontSize(label);
		});
		targetNoteEntryContainer.Add(visualElement);
		UpdateNotePosition(visualElement, note.MidiNote, note.StartBeat, note.EndBeat);
		noteToTargetNoteControl[note] = targetNoteControl;
		return targetNoteControl;
	}

	private void UpdateNoteLabelFontSize(Label label)
	{
		if (label != null && !label.text.IsNullOrEmpty())
		{
			float num = noteHeightPercent * targetNoteEntryContainer.resolvedStyle.height;
			float num2 = NumberUtils.Limit(num + 2f, 8f, 12f);
			label.style.fontSize = new StyleLength(new Length(num2, LengthUnit.Pixel));
			Debug.Log($"text: {label.text}, noteHeightPx: {num}, textHeight: {num2}");
		}
	}

	public string GetDisplayText(Note note)
	{
		switch (note.Type)
		{
		case ENoteType.Freestyle:
			return "<i><b><color=#c00000>" + note.Text + "</color></b></i>";
		case ENoteType.Golden:
			return "<b>" + note.Text + "</b>";
		case ENoteType.Rap:
		case ENoteType.RapGolden:
			return "<i><b><color=#ffa500ff>" + note.Text + "</color></b></i>";
		default:
			return note.Text;
		}
	}

	protected void CreateRecordedNoteControl(RecordedNote recordedNote, bool useRoundedMidiNote)
	{
		if (recordedNote.StartBeat != recordedNote.EndBeat)
		{
			int midiNote = ((!useRoundedMidiNote || recordedNote.TargetNote == null) ? recordedNote.RecordedMidiNote : MidiUtils.GetMidiNoteOnOctaveOfTargetMidiNote(recordedNote.RoundedMidiNote, recordedNote.TargetNote.MidiNote));
			VisualElement visualElement = noteUi.CloneTree().Children().First();
			Injector obj = UniInjectUtils.CreateInjector(injector);
			obj.AddBindingForInstance(obj);
			obj.AddBindingForInstance(recordedNote);
			obj.AddBindingForInstance("rootVisualElement", visualElement);
			RecordedNoteControl recordedNoteControl = new RecordedNoteControl();
			obj.Inject(recordedNoteControl);
			recordedNoteControl.StartBeat = recordedNote.StartBeat;
			recordedNoteControl.TargetEndBeat = recordedNote.EndBeat;
			recordedNoteControl.LifeTimeInSeconds = Time.deltaTime;
			recordedNoteControl.EndBeat = (double)recordedNote.StartBeat + (double)recordedNoteControl.LifeTimeInSeconds * beatsPerSecond;
			recordedNoteControl.MidiNote = midiNote;
			Label label = recordedNoteControl.Label;
			if (showPitchOfNotes)
			{
				string absoluteName = MidiUtils.GetAbsoluteName(midiNote);
				label.text = " (" + absoluteName + ")";
			}
			else
			{
				label.text = "";
			}
			recordedNoteEntryContainer.Add(visualElement);
			UpdateNotePosition(visualElement, midiNote, recordedNoteControl.StartBeat, recordedNoteControl.EndBeat);
			recordedNoteToRecordedNoteControlsMap.AddInsideList(recordedNote, recordedNoteControl);
		}
	}

	public void CreatePerfectSentenceEffect()
	{
		for (int i = 0; i < 50; i++)
		{
			CreatePerfectSentenceStar();
		}
	}

	protected void CreatePerfectSentenceStar()
	{
		VisualElement visualElement = perfectEffectStarUi.CloneTree().Children().First();
		visualElement.style.position = new StyleEnum<Position>(Position.Absolute);
		effectsContainer.Add(visualElement);
		StarParticleControl starControl = injector.WithRootVisualElement(visualElement).CreateAndInject<StarParticleControl>();
		float x = Random.Range(0f, 100f);
		float y = Random.Range(0f, 100f);
		Vector2 vector = new Vector2(x, y);
		starControl.SetPosition(vector);
		LeanTween.value(singSceneControl.gameObject, vector, vector + GetRandomVector2(-50f, 50f), 1f).setOnUpdate((Vector2 p) =>
		{
			starControl.SetPosition(p);
		});
		Vector2 vector2 = Vector2.one * Random.Range(0.2f, 0.5f);
		starControl.SetScale(Vector2.zero);
		LeanTween.value(singSceneControl.gameObject, vector2, vector2 * Random.Range(1f, 2f), 1f).setOnUpdate((Vector2 s) =>
		{
			starControl.SetScale(s);
		}).setOnComplete(() =>
		{
			RemoveStarControl(starControl);
		});
		starControls.Add(starControl);
	}

	private void RemoveStarControl(StarParticleControl starControl)
	{
		starControl.VisualElement.RemoveFromHierarchy();
		starControls.Remove(starControl);
	}

	public void CreatePerfectNoteEffect(Note perfectNote)
	{
		if (noteToTargetNoteControl.TryGetValue(perfectNote, out var value))
		{
			value.CreatePerfectNoteEffect();
		}
	}

	private Vector2 GetRandomVector2(float min, float max)
	{
		return new Vector2(Random.Range(min, max), Random.Range(min, max));
	}

	protected virtual int CalculateNoteRow(int midiNote)
	{
		int i = midiNote;
		while (i > maxNoteRowMidiNote && i > 0)
		{
			i -= 12;
		}
		for (; i < minNoteRowMidiNote && i < 127; i += 12)
		{
		}
		int num = i - avgMidiNote;
		return NumberUtils.Limit(noteRowCount / 2 + num, 0, noteRowCount - 1);
	}

	public Vector2 GetYStartAndEndInPercentForMidiNote(int midiNote)
	{
		int num = CalculateNoteRow(midiNote);
		float num2 = noteRowToYPercent[num];
		float x = num2 - noteHeightPercent;
		float y = num2 + noteHeightPercent;
		return new Vector2(x, y);
	}

	protected void UpdateRecordedNoteControlEndBeat(RecordedNoteControl recordedNoteControl)
	{
		recordedNoteControl.EndBeat = (double)recordedNoteControl.StartBeat + (double)recordedNoteControl.LifeTimeInSeconds * beatsPerSecond;
		if (recordedNoteControl.EndBeat > (double)recordedNoteControl.TargetEndBeat)
		{
			recordedNoteControl.EndBeat = recordedNoteControl.TargetEndBeat;
		}
	}

	protected virtual void RemoveTargetNote(TargetNoteControl targetNoteControl)
	{
		noteToTargetNoteControl.Remove(targetNoteControl.Note);
		targetNoteControl.Dispose();
	}

	protected virtual void RemoveRecordedNote(RecordedNoteControl recordedNoteControl)
	{
		recordedNoteToRecordedNoteControlsMap.Remove(recordedNoteControl.RecordedNote);
		recordedNoteControl.Dispose();
	}

	protected void RemoveTargetNotes()
	{
		noteToTargetNoteControl.Values.ToList().ForEach((TargetNoteControl targetNoteControl) =>
		{
			RemoveTargetNote(targetNoteControl);
		});
	}

	protected void RemoveRecordedNotes()
	{
		recordedNoteToRecordedNoteControlsMap.Values.ToList().ForEach((List<RecordedNoteControl> recordedNoteControls) =>
		{
			recordedNoteControls.ForEach((RecordedNoteControl recordedNoteControl) =>
			{
				RemoveRecordedNote(recordedNoteControl);
			});
		});
	}
}
