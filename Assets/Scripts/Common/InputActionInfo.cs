using UnityEngine;

public class InputActionInfo
{
	public const string InfoSeparator = " | ";

	public string InputText { get; private set; }

	public string ActionText { get; private set; }

	public Sprite InputSprite { get; private set; }

	public InputActionInfo(string actionText, string inputText, Sprite inputSprite = null)
	{
		ActionText = actionText;
		InputText = inputText;
		InputSprite = inputSprite;
	}
}
