using UniInject;
using UnityEngine;

public class NoteAreaDragControl : AbstractDragControl<NoteAreaDragEvent>
{
	[Inject]
	private NoteAreaControl noteAreaControl;

	protected override NoteAreaDragEvent CreateDragEventStart(DragControlPointerEvent eventData)
	{
		GeneralDragEvent generalDragEvent = CreateGeneralDragEventStart(eventData);
		int midiNoteDragStart = noteAreaControl.ScreenPixelPositionToMidiNote(generalDragEvent.ScreenCoordinateInPixels.StartPosition.y);
		int midiNoteDistance = 0;
		int positionInSongInMillisDragStart = noteAreaControl.ScreenPixelPositionToMillis(generalDragEvent.ScreenCoordinateInPixels.StartPosition.x);
		int millisDistance = 0;
		int positionInSongInBeatsDragStart = noteAreaControl.ScreenPixelPositionToBeat(generalDragEvent.ScreenCoordinateInPixels.StartPosition.x);
		int beatDistance = 0;
		return new NoteAreaDragEvent(generalDragEvent, midiNoteDragStart, midiNoteDistance, positionInSongInMillisDragStart, millisDistance, positionInSongInBeatsDragStart, beatDistance);
	}

	protected override NoteAreaDragEvent CreateDragEvent(DragControlPointerEvent eventData, NoteAreaDragEvent dragStartEvent)
	{
		GeneralDragEvent generalDragEvent = CreateGeneralDragEvent(eventData, dragStartEvent.GeneralDragEvent);
		int midiNoteDragStart = dragStartEvent.MidiNoteDragStart;
		int midiNoteDistance = (int)Mathf.Round(generalDragEvent.LocalCoordinateInPercent.Distance.y * (float)noteAreaControl.ViewportHeight);
		int positionInSongInMillisDragStart = dragStartEvent.PositionInSongInMillisDragStart;
		int millisDistance = (int)Mathf.Round(generalDragEvent.LocalCoordinateInPercent.Distance.x * (float)noteAreaControl.ViewportWidth);
		int positionInSongInBeatsDragStart = dragStartEvent.PositionInSongInBeatsDragStart;
		int beatDistance = (int)Mathf.Round(generalDragEvent.LocalCoordinateInPercent.Distance.x * (float)noteAreaControl.ViewportWidthInBeats);
		return new NoteAreaDragEvent(generalDragEvent, midiNoteDragStart, midiNoteDistance, positionInSongInMillisDragStart, millisDistance, positionInSongInBeatsDragStart, beatDistance);
	}
}
