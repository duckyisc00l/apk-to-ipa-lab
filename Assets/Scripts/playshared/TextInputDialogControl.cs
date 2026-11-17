using System;
using UniInject;
using UniRx;
using UnityEngine.UIElements;

public class TextInputDialogControl : AbstractDialogControl, IInjectionFinishedListener
{
	[Inject(UxmlName = "dialogTitle")]
	protected Label dialogTitle;

	[Inject(UxmlName = "dialogMessage")]
	protected Label dialogMessage;

	[Inject(UxmlName = "invalidValueIcon")]
	protected VisualElement invalidValueIcon;

	[Inject(UxmlName = "invalidValueLabel")]
	protected Label invalidValueLabel;

	[Inject(UxmlName = "valueTextField")]
	protected TextField textField;

	[Inject(UxmlName = "okButton")]
	protected Button okButton;

	[Inject(UxmlName = "cancelButton")]
	protected Button cancelButton;

	private readonly Subject<string> submitValueEventStream = new Subject<string>();

	private string initialValue = "";

	public IObservable<string> SubmitValueEventStream => submitValueEventStream;

	public Func<string, ValueInputDialogValidationResult> ValidateValueCallback { get; set; } = DefaultValidateValueCallback;

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

	public string Value
	{
		get
		{
			return textField.value;
		}
		set
		{
			textField.value = value;
		}
	}

	public string InitialValue
	{
		get
		{
			return initialValue;
		}
		set
		{
			initialValue = value;
			Value = value;
			HideValidationMessage();
		}
	}

	public virtual void OnInjectionFinished()
	{
		okButton.RegisterCallbackButtonTriggered(() =>
		{
			TrySubmitValue(textField.value);
		});
		cancelButton.RegisterCallbackButtonTriggered(() =>
		{
			CloseDialog();
		});
		textField.RegisterValueChangedCallback((ChangeEvent<string> evt) =>
		{
			ValidateValue(evt.newValue, showMessageIfInvalid: true);
		});
		cancelButton.Focus();
		InitialValue = "";
		ValidateValue(InitialValue, showMessageIfInvalid: false);
	}

	public void Reset()
	{
		Value = initialValue;
	}

	private void TrySubmitValue(string textValue)
	{
		if (ValidateValueCallback == null || ValidateValueCallback(textValue).Severity != EValueInputDialogValidationResultSeverity.Error)
		{
			submitValueEventStream.OnNext(textValue);
			CloseDialog();
		}
	}

	protected void ValidateValue(string textValue, bool showMessageIfInvalid)
	{
		if (ValidateValueCallback == null)
		{
			HideValidationMessageAndEnableOkButton();
			return;
		}
		ValueInputDialogValidationResult valueInputDialogValidationResult = ValidateValueCallback(textValue);
		if (valueInputDialogValidationResult.Severity == EValueInputDialogValidationResultSeverity.None)
		{
			HideValidationMessageAndEnableOkButton();
			return;
		}
		okButton.SetEnabled(value: false);
		if (showMessageIfInvalid)
		{
			invalidValueIcon.ShowByVisibility();
			invalidValueLabel.ShowByVisibility();
		}
		invalidValueLabel.text = valueInputDialogValidationResult.Message;
		if (valueInputDialogValidationResult.Severity == EValueInputDialogValidationResultSeverity.Warning)
		{
			invalidValueIcon.AddToClassList("warning");
		}
		else if (valueInputDialogValidationResult.Severity == EValueInputDialogValidationResultSeverity.Error)
		{
			invalidValueIcon.AddToClassList("error");
		}
	}

	private void HideValidationMessageAndEnableOkButton()
	{
		HideValidationMessage();
		okButton.SetEnabled(value: true);
	}

	private void HideValidationMessage()
	{
		invalidValueIcon.HideByVisibility();
		invalidValueLabel.HideByVisibility();
		invalidValueIcon.RemoveFromClassList("warning");
		invalidValueIcon.RemoveFromClassList("error");
	}

	private static ValueInputDialogValidationResult DefaultValidateValueCallback(string newValue)
	{
		if (newValue.IsNullOrEmpty())
		{
			return ValueInputDialogValidationResult.CreateErrorResult("Enter a value please");
		}
		return ValueInputDialogValidationResult.CreateValidResult();
	}
}
