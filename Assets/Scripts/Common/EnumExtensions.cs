using ProTrans;

public static class EnumExtensions
{
	public static string GetTranslatedName(this ESongOrder songOrder)
	{
		return songOrder switch
		{
			ESongOrder.Artist => TranslationManager.GetTranslation(R.Messages.order_Artist), 
			ESongOrder.Title => TranslationManager.GetTranslation(R.Messages.order_Title), 
			ESongOrder.Genre => TranslationManager.GetTranslation(R.Messages.order_Genre), 
			ESongOrder.Language => TranslationManager.GetTranslation(R.Messages.order_Language), 
			ESongOrder.Folder => TranslationManager.GetTranslation(R.Messages.order_Folder), 
			ESongOrder.Year => TranslationManager.GetTranslation(R.Messages.order_Year), 
			ESongOrder.CountCanceled => TranslationManager.GetTranslation(R.Messages.order_CountCanceled), 
			ESongOrder.CountFinished => TranslationManager.GetTranslation(R.Messages.order_CountFinished), 
			_ => TranslationManager.GetTranslation(R.Messages.order_Artist), 
		};
	}
}
