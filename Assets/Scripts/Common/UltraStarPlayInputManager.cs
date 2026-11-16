using System;
using System.Collections.Generic;
using System.Linq;
using PrimeInputActions;
using UniInject;
using UniRx;
using UnityEngine;
using UnityEngine.InputSystem;
using UnityEngine.InputSystem.Controls;
using UnityEngine.InputSystem.EnhancedTouch;
using UnityEngine.UIElements;

public class UltraStarPlayInputManager : InputManager, INeedInjection
{
	private static readonly Dictionary<InputDevice, InputDeviceChange> inputDeviceToLastChange = new Dictionary<InputDevice, InputDeviceChange>();

	private readonly Subject<InputDeviceChangeEvent> inputDeviceChangeEventStream = new Subject<InputDeviceChangeEvent>();

	private EInputDevice inputDeviceEnum = GetDefaultInputDeviceEnum();

	[Inject(UxmlName = "inputDeviceIconKeyboardAndMouse", Optional = true)]
	private VisualElement inputDeviceIconKeyboardAndMouse;

	[Inject(UxmlName = "inputDeviceIconGamepad", Optional = true)]
	private VisualElement inputDeviceIconGamepad;

	[Inject(UxmlName = "inputDeviceIconTouch", Optional = true)]
	private VisualElement inputDeviceIconTouch;

	public IObservable<InputDeviceChangeEvent> InputDeviceChangeEventStream => inputDeviceChangeEventStream;

	public EInputDevice InputDeviceEnum
	{
		get
		{
			return inputDeviceEnum;
		}
		private set
		{
			if (inputDeviceEnum != value)
			{
				inputDeviceEnum = value;
				inputDeviceChangeEventStream.OnNext(new InputDeviceChangeEvent());
			}
		}
	}

	[RuntimeInitializeOnLoadMethod(RuntimeInitializeLoadType.SubsystemRegistration)]
	private static void StaticInit()
	{
		inputDeviceToLastChange.Clear();
	}

	private void OnEnable()
	{
		InputSystem.onDeviceChange += OnDeviceChange;
	}

	private void OnDisable()
	{
		InputSystem.onDeviceChange -= OnDeviceChange;
	}

	private void Start()
	{
		try
		{
			EnhancedTouchSupport.Enable();
		}
		catch (Exception exception)
		{
			Log.Logger.Error(exception, "Could not enable enhanced touch support");
		}
		UpdateInputDeviceIcon();
		InputDeviceChangeEventStream.Subscribe((InputDeviceChangeEvent _) =>
		{
			UpdateInputDeviceIcon();
		});
		StartCoroutine(CoroutineUtils.ExecuteRepeatedlyInSeconds(0.1f, () =>
		{
			UpdateInputDeviceEnum();
		}));
	}

	private void UpdateInputDeviceEnum()
	{
		if (Keyboard.current != null && Keyboard.current.anyKey.isPressed)
		{
			InputDeviceEnum = EInputDevice.KeyboardAndMouse;
		}
		if (Gamepad.current != null && Gamepad.all.AnyMatch((Gamepad gamepad) => gamepad.allControls.Any((InputControl inputControl) => inputControl is ButtonControl { isPressed: not false } buttonControl && !buttonControl.synthetic)))
		{
			InputDeviceEnum = EInputDevice.Gamepad;
		}
		if (Touch.activeTouches.Count > 0)
		{
			InputDeviceEnum = EInputDevice.Touch;
		}
	}

	private void OnDeviceChange(InputDevice inputDevice, InputDeviceChange inputDeviceChange)
	{
		inputDeviceToLastChange[inputDevice] = inputDeviceChange;
		inputDeviceChangeEventStream.OnNext(new InputDeviceChangeEvent());
	}

	private static EInputDevice GetDefaultInputDeviceEnum()
	{
		if (Gamepad.current != null)
		{
			return EInputDevice.Gamepad;
		}
		if (Keyboard.current != null)
		{
			return EInputDevice.KeyboardAndMouse;
		}
		return EInputDevice.Touch;
	}

	private void UpdateInputDeviceIcon()
	{
		inputDeviceIconKeyboardAndMouse?.SetVisibleByDisplay(inputDeviceEnum == EInputDevice.KeyboardAndMouse);
		inputDeviceIconGamepad?.SetVisibleByDisplay(inputDeviceEnum == EInputDevice.Gamepad);
		inputDeviceIconTouch?.SetVisibleByDisplay(inputDeviceEnum == EInputDevice.Touch);
	}
}
