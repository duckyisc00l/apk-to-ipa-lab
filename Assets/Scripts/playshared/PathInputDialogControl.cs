using System.IO;
using UnityEngine.UIElements;

public class PathInputDialogControl : TextInputDialogControl
{
	public override void OnInjectionFinished()
	{
		textField.RegisterValueChangedCallback((ChangeEvent<string> evt) =>
		{
			ValidateValue(evt.newValue, showMessageIfInvalid: true);
		});
		base.OnInjectionFinished();
		base.ValidateValueCallback = (string newValue) =>
		{
			if (newValue.IsNullOrEmpty())
			{
				return ValueInputDialogValidationResult.CreateErrorResult("Enter a value please");
			}
			return (File.Exists(newValue) || Directory.Exists(newValue)) ? ValueInputDialogValidationResult.CreateValidResult() : ValueInputDialogValidationResult.CreateErrorResult("File not found");
		};
	}
}
