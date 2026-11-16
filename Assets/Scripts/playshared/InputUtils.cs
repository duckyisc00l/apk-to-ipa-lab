using PrimeInputActions;
using UnityEngine;
using UnityEngine.InputSystem;
using UnityEngine.InputSystem.Controls;
using UnityEngine.InputSystem.EnhancedTouch;
using UnityEngine.UIElements;

public static class InputUtils
{
	public const float DoubleClickThresholdInSeconds = 0.3f;

	public const float DragDistanceThresholdInPx = 5f;

	public static EKeyboardModifier GetCurrentKeyboardModifier()
	{
		if (Keyboard.current == null)
		{
			return EKeyboardModifier.None;
		}
		bool flag = Keyboard.current.leftCtrlKey.isPressed || Keyboard.current.rightCtrlKey.isPressed;
		bool flag2 = Keyboard.current.leftShiftKey.isPressed || Keyboard.current.rightShiftKey.isPressed;
		bool flag3 = Keyboard.current.leftAltKey.isPressed || Keyboard.current.rightAltKey.isPressed;
		if (flag && !flag2 && !flag3)
		{
			return EKeyboardModifier.Ctrl;
		}
		if ((!flag & flag2) && !flag3)
		{
			return EKeyboardModifier.Shift;
		}
		if ((!flag && !flag2) & flag3)
		{
			return EKeyboardModifier.Alt;
		}
		if ((flag & flag2) && !flag3)
		{
			return EKeyboardModifier.CtrlShift;
		}
		if ((flag && !flag2) & flag3)
		{
			return EKeyboardModifier.CtrlAlt;
		}
		if (!flag & flag2 & flag3)
		{
			return EKeyboardModifier.ShiftAlt;
		}
		if (flag & flag2 & flag3)
		{
			return EKeyboardModifier.CtrlShiftAlt;
		}
		return EKeyboardModifier.None;
	}

	public static bool AnyKeyboardModifierPressed()
	{
		return InputManager.GetInputAction("usplay/anyKeyboardModifier").ReadValue<float>() > 0f;
	}

	public static bool AnyKeyboardOrMouseOrTouchPressed()
	{
		if (!AnyKeyboardButtonPressed() && !AnyMouseButtonPressed())
		{
			return AnyTouchscreenPressed();
		}
		return true;
	}

	public static bool AnyKeyboardButtonPressed()
	{
		if (Keyboard.current != null)
		{
			return Keyboard.current.anyKey.ReadValue() > 0f;
		}
		return false;
	}

	public static bool AnyMouseButtonPressed()
	{
		if (Mouse.current != null)
		{
			if (!Mouse.current.leftButton.isPressed && !Mouse.current.rightButton.isPressed)
			{
				return Mouse.current.middleButton.isPressed;
			}
			return true;
		}
		return false;
	}

	public static bool AnyTouchscreenPressed()
	{
		return UnityEngine.InputSystem.EnhancedTouch.Touch.activeTouches.Count > 0;
	}

	public static bool IsKeyboardShiftPressed()
	{
		if (Keyboard.current != null)
		{
			if (!Keyboard.current.leftShiftKey.isPressed)
			{
				return Keyboard.current.rightShiftKey.isPressed;
			}
			return true;
		}
		return false;
	}

	public static bool IsKeyboardControlPressed()
	{
		if (Keyboard.current != null)
		{
			if (!Keyboard.current.leftCtrlKey.isPressed)
			{
				return Keyboard.current.rightCtrlKey.isPressed;
			}
			return true;
		}
		return false;
	}

	public static bool IsAnyKeyboardModifierPressed()
	{
		if (!IsKeyboardShiftPressed() && !IsKeyboardControlPressed())
		{
			return IsKeyboardAltPressed();
		}
		return true;
	}

	public static bool IsKeyboardAltPressed()
	{
		if (Keyboard.current != null)
		{
			if (!Keyboard.current.leftAltKey.isPressed)
			{
				return Keyboard.current.rightAltKey.isPressed;
			}
			return true;
		}
		return false;
	}

	public static bool WasPressedOrReleasedInThisFrame(ButtonControl buttonControl)
	{
		if (!buttonControl.wasPressedThisFrame)
		{
			return buttonControl.wasReleasedThisFrame;
		}
		return true;
	}

	public static Vector2 GetMousePosition()
	{
		if (Mouse.current == null)
		{
			return Vector2.zero;
		}
		return Mouse.current.position.ReadValue();
	}

	public static Vector2 GetPointerPositionInPanelCoordinates(PanelHelper panelHelper, bool invertY = false)
	{
		Vector2 v = new Vector2(Pointer.current.position.x.ReadValue(), Pointer.current.position.y.ReadValue());
		Vector2 result = panelHelper.ScreenToPanel(v);
		if (invertY)
		{
			Vector2 screenSizeInPanelCoordinates = ApplicationUtils.GetScreenSizeInPanelCoordinates(panelHelper);
			return new Vector2(result.x, screenSizeInPanelCoordinates.y - result.y);
		}
		return result;
	}

	public static bool IsPointerOverVisualElement(VisualElement visualElement, PanelHelper panelHelper)
	{
		Vector2 pointerPositionInPanelCoordinates = GetPointerPositionInPanelCoordinates(panelHelper, invertY: true);
		pointerPositionInPanelCoordinates = new Vector2(pointerPositionInPanelCoordinates.x, pointerPositionInPanelCoordinates.y);
		Rect worldBound = visualElement.worldBound;
		if (worldBound.xMin <= pointerPositionInPanelCoordinates.x && pointerPositionInPanelCoordinates.x <= worldBound.xMax && worldBound.yMin <= pointerPositionInPanelCoordinates.y)
		{
			return pointerPositionInPanelCoordinates.y <= worldBound.yMax;
		}
		return false;
	}
}
