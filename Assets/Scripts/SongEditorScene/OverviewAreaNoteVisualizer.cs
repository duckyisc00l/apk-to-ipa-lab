using System;
using System.Collections.Generic;
using System.Linq;
using UniInject;
using UniRx;
using UnityEngine;
using UnityEngine.UIElements;

public class OverviewAreaNoteVisualizer : INeedInjection, IInjectionFinishedListener
{
	[Inject]
	private SongMeta songMeta;

	[Inject]
	private SongMetaChangeEventStream songMetaChangeEventStream;

	[Inject]
	private SongEditorSceneControl songEditorSceneControl;

	[Inject]
	private SongAudioPlayer songAudioPlayer;

	[Inject]
	private SongEditorLayerManager songEditorLayerManager;

	[Inject(UxmlName = "overviewAreaNotes")]
	private VisualElement overviewAreaNotes;

	private DynamicTexture dynamicTexture;

	public void OnInjectionFinished()
	{
		songMetaChangeEventStream.Subscribe(OnSongMetaChanged);
		overviewAreaNotes.RegisterCallbackOneShot((GeometryChangedEvent evt) =>
		{
			dynamicTexture = new DynamicTexture(songEditorSceneControl.gameObject, overviewAreaNotes);
			UpdateNoteOverviewImage();
		});
	}

	private void OnSongMetaChanged(SongMetaChangeEvent changeEvent)
	{
		if (!(changeEvent is LyricsChangedEvent))
		{
			UpdateNoteOverviewImage();
		}
	}

	private void UpdateNoteOverviewImage()
	{
		if (dynamicTexture == null)
		{
			return;
		}
		dynamicTexture.ClearTexture();
		foreach (Voice voice in songMeta.GetVoices())
		{
			Color voiceLayerColor = songEditorLayerManager.GetVoiceLayerColor(voice.Name);
			DrawNotes(voice, voiceLayerColor);
		}
		dynamicTexture.ApplyTexture();
	}

	private void DrawNotes(Voice voice, Color color)
	{
		if (dynamicTexture == null)
		{
			return;
		}
		List<Note> list = voice.Sentences.SelectMany((Sentence sentence) => sentence.Notes).ToList();
		if (list.IsNullOrEmpty())
		{
			return;
		}
		int num = (int)Math.Ceiling(songAudioPlayer.AudioClip.length * 1000f);
		int num2 = 1;
		int num3 = list.Select((Note note) => note.MidiNote).Min() - num2;
		int num4 = list.Select((Note note) => note.MidiNote).Max() + num2 - num3;
		foreach (Note item in list)
		{
			double value = BpmUtils.BeatToMillisecondsInSong(songMeta, item.StartBeat);
			value = NumberUtils.Limit(value, 0.0, num);
			double num5 = BpmUtils.BeatToMillisecondsInSong(songMeta, item.EndBeat);
			value = NumberUtils.Limit(value, 0.0, num);
			int num6 = dynamicTexture.TextureHeight * (item.MidiNote - num3) / num4;
			int num7 = dynamicTexture.TextureHeight / num4 * 2;
			int num8 = num6 + num7;
			int a = (int)((double)dynamicTexture.TextureWidth * value / (double)num);
			int b = (int)((double)dynamicTexture.TextureWidth * num5 / (double)num);
			if (b < a)
			{
				ObjectUtils.Swap(ref a, ref b);
			}
			b = ((b < dynamicTexture.TextureWidth) ? b : (dynamicTexture.TextureWidth - 1));
			num8 = ((num8 < dynamicTexture.TextureHeight) ? num8 : (dynamicTexture.TextureHeight - 1));
			dynamicTexture.DrawRectByCorners(a, num6, b, num8, color);
		}
	}
}
