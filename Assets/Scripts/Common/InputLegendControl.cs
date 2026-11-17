using System;
using System.Linq;
using PrimeInputActions;
using UnityEngine.InputSystem;
using UnityEngine.UIElements;

public static class InputLegendControl
{
	public static VisualElement TryAddInputActionInfo(string inputActionPath, string actionText, VisualElement targetVisualElement)
	{
		if (targetVisualElement == null)
		{
			return null;
		}
		InputDevice inputDevice = (InputManager.Instance as UltraStarPlayInputManager)?.InputDeviceEnum.GetInputDevice();
		string bindingDisplayString = GetBindingDisplayString(InputManager.GetInputAction(inputActionPath).InputAction, inputDevice);
		if (bindingDisplayString.IsNullOrEmpty())
		{
			return null;
		}
		VisualElement visualElement = CreateInputActionInfoUi(new InputActionInfo(actionText, bindingDisplayString));
		targetVisualElement.Add(visualElement);
		return visualElement;
	}

	private static string GetBindingDisplayString(InputAction inputAction, InputDevice inputDevice)
	{
		try
		{
			string bindingDisplayString = inputAction.GetBindingDisplayString(InputBinding.DisplayStringOptions.DontOmitDevice);
			if (bindingDisplayString.IsNullOrEmpty())
			{
				return "";
			}
			string[] source = bindingDisplayString.Split(" | ");
			string displayStringDeviceText = GetDisplayStringDeviceText(inputDevice);
			if (displayStringDeviceText.IsNullOrEmpty())
			{
				return "";
			}
			string text = source.FirstOrDefault((string it) => it.Contains(displayStringDeviceText));
			if (text.IsNullOrEmpty())
			{
				return "";
			}
			return text.Replace(displayStringDeviceText, "").Replace(" +", "+").Replace("+ ", "+")
				.Trim();
		}
		catch (NotImplementedException exception)
		{
			Log.Logger.Error(exception, "Could not determine BindingDisplayString for InputAction '" + inputAction.name + "'");
			return "";
		}
	}

	public static VisualElement CreateInputActionInfoUi(InputActionInfo entry)
	{
		Label label = new Label();
		label.AddToClassList("inputLegendLabel");
		label.text = entry.InputText + ": " + entry.ActionText;
		return label;
	}

	private static string GetDisplayStringDeviceText(InputDevice inputDevice)
	{
		if (Gamepad.current != null && inputDevice == Gamepad.current)
		{
			return "[" + Gamepad.current.displayName + "]";
		}
		if (Keyboard.current != null && inputDevice == Keyboard.current)
		{
			return "[" + Keyboard.current.displayName + "]";
		}
		if (Mouse.current != null && inputDevice == Keyboard.current)
		{
			return "[" + Mouse.current.displayName + "]";
		}
		if (Touchscreen.current != null && inputDevice == Touchscreen.current)
		{
			return "[" + Touchscreen.current.displayName + "]";
		}
		return "";
	}
}
