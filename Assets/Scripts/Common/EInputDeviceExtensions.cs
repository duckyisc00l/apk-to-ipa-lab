using System;
using UnityEngine.InputSystem;

public static class EInputDeviceExtensions
{
	public static InputDevice GetInputDevice(this EInputDevice inputDevice)
	{
		return inputDevice switch
		{
			EInputDevice.KeyboardAndMouse => Keyboard.current, 
			EInputDevice.Gamepad => Gamepad.current, 
			EInputDevice.Touch => Touchscreen.current, 
			_ => throw new ArgumentException($"No enum value defined for InputDevice {inputDevice}"), 
		};
	}

	public static EInputDevice GetInputDeviceEnum(this InputDevice inputDevice)
	{
		if (inputDevice == Keyboard.current)
		{
			return EInputDevice.KeyboardAndMouse;
		}
		if (inputDevice == Gamepad.current)
		{
			return EInputDevice.Gamepad;
		}
		if (inputDevice == Touchscreen.current)
		{
			return EInputDevice.Touch;
		}
		throw new ArgumentException($"No enum value defined for InputDevice {inputDevice}");
	}
}
