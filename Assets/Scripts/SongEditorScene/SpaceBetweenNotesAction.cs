using System.Collections.Generic;
using System.Linq;
using UniInject;

public class SpaceBetweenNotesAction : INeedInjection
{
	[Inject]
	private SongMetaChangeEventStream songMetaChangeEventStream;

	[Inject]
	private UiManager uiManager;

	public void Execute(IReadOnlyCollection<Note> selectedNotes, int spaceInBeats)
	{
		if (spaceInBeats <= 0)
		{
			UiManager.CreateNotification("Minimum amount of space (in beats) must be greater than 0.");
			return;
		}
		List<Note> list = selectedNotes.OrderBy((Note note3) => note3.StartBeat).ToList();
		for (int num = 0; num < list.Count - 1; num++)
		{
			Note note = list[num];
			Note note2 = list[num + 1];
			if (note2.StartBeat - note.EndBeat < spaceInBeats)
			{
				int num2 = note2.StartBeat - spaceInBeats;
				if (num2 > note.StartBeat)
				{
					note.SetEndBeat(num2);
				}
				else
				{
					note.SetLength(1);
				}
			}
		}
	}

	public void ExecuteAndNotify(IReadOnlyCollection<Note> selectedNotes, int spaceInBeats)
	{
		Execute(selectedNotes, spaceInBeats);
		songMetaChangeEventStream.OnNext(new NotesChangedEvent());
	}
}
