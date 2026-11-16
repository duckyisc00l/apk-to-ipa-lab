using UniInject;
using UnityEngine.InputSystem;
using UnityEngine.UIElements;

public abstract class EditorLyricsInputPopupControl : INeedInjection, IInjectionFinishedListener
{
	[Inject]
	protected SongMetaChangeEventStream songMetaChangeEventStream;

	[Inject]
	protected SongEditorSceneControl songEditorSceneControl;

	[Inject(UxmlName = "editLyricsPopupTextField")]
	protected TextField textField;

	private string initialText;

	private bool isActive;

	protected abstract string GetInitialText();

	protected abstract void ApplyNewText(string newText);

	protected abstract void PreviewNewText(string newText);

	public virtual void OnInjectionFinished()
	{
		initialText = GetInitialText();
		textField.value = initialText;
		textField.Focus();
		RegisterEvents();
	}

	private void OnTextFieldValueChanged(string newInputFieldText)
	{
		string text = ShowWhiteSpaceText.ReplaceWhiteSpaceWithVisibleCharacters(newInputFieldText);
		if (textField.value != text)
		{
			textField.value = text;
		}
		PreviewNewText(text);
	}

	public void UndoAndCloseLyricsDialog()
	{
		ApplyNewText(initialText);
		CloseLyricsDialog();
	}

	public void SubmitAndCloseLyricsDialog()
	{
		string newText = ShowWhiteSpaceText.ReplaceVisibleCharactersWithWhiteSpace(textField.value);
		ApplyNewText(newText);
		CloseLyricsDialog();
	}

	private void CloseLyricsDialog()
	{
		UnregisterEvents();
		songEditorSceneControl.HideEditLyricsPopup();
		if (textField.focusController.focusedElement == textField)
		{
			textField.Blur();
		}
	}

	private void RegisterEvents()
	{
		textField.RegisterValueChangedCallback(ValueChangedCallback);
		textField.RegisterCallback<BlurEvent>(OnBlur);
		isActive = true;
	}

	private void UnregisterEvents()
	{
		textField.UnregisterValueChangedCallback(ValueChangedCallback);
		textField.UnregisterCallback<BlurEvent>(OnBlur);
		isActive = false;
	}

	private void ValueChangedCallback(ChangeEvent<string> evt)
	{
		OnTextFieldValueChanged(evt.newValue);
	}

	private void OnBlur(BlurEvent evt)
	{
		if (Keyboard.current != null && Keyboard.current.escapeKey.isPressed)
		{
			UndoAndCloseLyricsDialog();
		}
		else
		{
			SubmitAndCloseLyricsDialog();
		}
	}

	public bool IsActive()
	{
		return isActive;
	}
}
