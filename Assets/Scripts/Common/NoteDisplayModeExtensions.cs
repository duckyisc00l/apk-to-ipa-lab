using ProTrans;

public static class NoteDisplayModeExtensions
{
	public static string GetTranslation(this ENoteDisplayMode noteDisplayMode)
	{
		return noteDisplayMode switch
		{
			ENoteDisplayMode.SentenceBySentence => TranslationManager.GetTranslation(R.Messages.options_noteDisplayMode_sentenceBySentence), 
			ENoteDisplayMode.ScrollingNoteStream => TranslationManager.GetTranslation(R.Messages.options_noteDisplayMode_scrollingNoteStream), 
			ENoteDisplayMode.None => TranslationManager.GetTranslation(R.Messages.options_noteDisplayMode_none), 
			_ => noteDisplayMode.ToString(), 
		};
	}
}
