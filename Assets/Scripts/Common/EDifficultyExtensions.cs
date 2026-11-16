using ProTrans;
using UnityEngine;

public static class EDifficultyExtensions
{
	public static string GetTranslatedName(this EDifficulty difficulty)
	{
		return TranslationManager.GetTranslation(difficulty.GetI18NCode());
	}

	private static string GetI18NCode(this EDifficulty difficulty)
	{
		return difficulty switch
		{
			EDifficulty.Easy => R.Messages.difficulty_easy, 
			EDifficulty.Medium => R.Messages.difficulty_medium, 
			EDifficulty.Hard => R.Messages.difficulty_hard, 
			_ => throw new UnityException("Unhandled difficulty: " + difficulty), 
		};
	}

	public static int GetRoundingDistance(this EDifficulty difficulty)
	{
		return difficulty switch
		{
			EDifficulty.Easy => 2, 
			EDifficulty.Medium => 1, 
			EDifficulty.Hard => 0, 
			_ => throw new UnityException("Unhandled difficulty: " + difficulty), 
		};
	}

	public static int GetIndex(this EDifficulty difficulty)
	{
		return difficulty switch
		{
			EDifficulty.Easy => 0, 
			EDifficulty.Medium => 1, 
			EDifficulty.Hard => 2, 
			_ => throw new UnityException("Unhandled difficulty: " + difficulty), 
		};
	}
}
