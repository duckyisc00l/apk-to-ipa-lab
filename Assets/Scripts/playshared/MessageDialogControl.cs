using System;
using UniInject;
using UnityEngine.UIElements;

public class MessageDialogControl : AbstractDialogControl, IInjectionFinishedListener
{
	[Inject(UxmlName = "dialogTitle")]
	private Label dialogTitle;

	[Inject(UxmlName = "dialogMessageContainer")]
	private VisualElement dialogMessageContainer;

	[Inject(UxmlName = "dialogMessage")]
	private Label dialogMessage;

	[Inject(UxmlName = "dialogButtonContainer")]
	private VisualElement dialogButtonContainer;

	[Inject]
	private Injector injector;

	[Inject(UxmlName = "dialogTitleImage")]
	public VisualElement DialogTitleImage { get; private set; }

	public string Title
	{
		get
		{
			return dialogTitle.text;
		}
		set
		{
			dialogTitle.text = value;
		}
	}

	public string Message
	{
		get
		{
			return dialogMessage.text;
		}
		set
		{
			dialogMessage.text = value;
		}
	}

	public void OnInjectionFinished()
	{
		dialogTitle.text = "";
		dialogMessage.text = "";
	}

	public Button AddButton(string text, Action callback)
	{
		Button button = new Button();
		dialogButtonContainer.Add(button);
		button.text = text;
		button.focusable = true;
		button.RegisterCallbackButtonTriggered(callback);
		return button;
	}

	public void AddVisualElement(VisualElement visualElement)
	{
		dialogMessageContainer.Add(visualElement);
	}
}
