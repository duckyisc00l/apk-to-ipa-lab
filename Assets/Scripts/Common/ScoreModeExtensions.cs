using System;
using ProTrans;

public static class ScoreModeExtensions
{
	public static string GetTranslation(this EScoreMode scoreMode)
	{
		return scoreMode switch
		{
			EScoreMode.Individual => TranslationManager.GetTranslation(R.Messages.enum_scoreMode_individual), 
			EScoreMode.CommonAverage => TranslationManager.GetTranslation(R.Messages.enum_scoreMode_commonAverage), 
			EScoreMode.None => TranslationManager.GetTranslation(R.Messages.enum_scoreMode_none), 
			_ => throw new ArgumentOutOfRangeException("scoreMode", scoreMode, null), 
		};
	}
}
