using UnityEngine;

public class ShowWhiteSpaceText : MonoBehaviour
{
	public static readonly string spaceReplacement = "•";

	public static readonly string newlineReplacement = "↵\n";

	public static readonly string newlineVisibleWhiteSpaceCharacter = "↵";

	public static string ReplaceVisibleCharactersWithWhiteSpace(string text)
	{
		return text.Replace(spaceReplacement, " ").Replace(newlineReplacement, "⌇").Replace("\n", "")
			.Replace("⌇", "\n");
	}

	public static string ReplaceWhiteSpaceWithVisibleCharacters(string text)
	{
		return text.Replace(" ", spaceReplacement).Replace("\n", newlineReplacement);
	}
}
