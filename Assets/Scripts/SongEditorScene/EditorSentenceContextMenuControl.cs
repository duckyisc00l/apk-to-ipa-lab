using System.Collections.Generic;
using UniInject;

public class EditorSentenceContextMenuControl : ContextMenuControl
{
	[Inject]
	private DeleteSentencesAction deleteSentencesAction;

	[Inject]
	private SentenceFitToNoteAction sentenceFitToNoteAction;

	[Inject]
	private SongMeta songMeta;

	[Inject]
	private EditorSentenceControl sentenceControl;

	public override void OnInjectionFinished()
	{
		base.OnInjectionFinished();
		base.FillContextMenuAction = FillContextMenu;
	}

	private void FillContextMenu(ContextMenuPopupControl contextMenu)
	{
		List<Sentence> selectedSentences = new List<Sentence> { sentenceControl.Sentence };
		contextMenu.AddItem("Fit to notes", () =>
		{
			sentenceFitToNoteAction.ExecuteAndNotify(selectedSentences);
		});
		contextMenu.AddItem("Fit to notes (all phrases)", () =>
		{
			sentenceFitToNoteAction.ExecuteAndNotify(SongMetaUtils.GetAllSentences(songMeta));
		});
		contextMenu.AddSeparator();
		contextMenu.AddItem("Edit lyrics", () =>
		{
			sentenceControl.StartEditingLyrics();
		});
		contextMenu.AddSeparator();
		contextMenu.AddItem("Delete", () =>
		{
			deleteSentencesAction.ExecuteAndNotify(selectedSentences);
		});
	}
}
