using System.Collections.Generic;
using UniInject;

public class EditorSentenceLyricsInputControl : EditorLyricsInputPopupControl
{
	[Inject]
	private EditorSentenceControl editorSentenceControl;

	private string lastEditModeText;

	protected override string GetInitialText()
	{
		return ShowWhiteSpaceText.ReplaceWhiteSpaceWithVisibleCharacters(LyricsUtils.GetEditModeText(editorSentenceControl.Sentence));
	}

	protected override void PreviewNewText(string newText)
	{
		ApplyEditModeText(newText, undoable: false);
	}

	protected override void ApplyNewText(string newText)
	{
		if (!LyricsUtils.IsOnlyWhitespace(newText))
		{
			ApplyEditModeText(newText, undoable: true);
		}
	}

	private void ApplyEditModeText(string editModeText, bool undoable)
	{
		LyricsUtils.MapEditModeTextToNotes(ShowWhiteSpaceText.ReplaceVisibleCharactersWithWhiteSpace(editModeText), new List<Sentence> { editorSentenceControl.Sentence });
		songMetaChangeEventStream.OnNext(new LyricsChangedEvent
		{
			Undoable = undoable
		});
	}
}
