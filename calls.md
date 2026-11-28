=== src/Rewired.Demos.GamepadTemplateUI/GamepadTemplateUI.cs
271:		float axis = player.GetAxis(actionId);
295:				else if (controllerTemplateElementTarget.elementType == ControllerTemplateElementType.Button && (player.GetButton(actionId) || player.GetNegativeButton(actionId)))
=== src/Player.cs
63:		Cursor.visible = false;
64:		Cursor.lockState = CursorLockMode.Locked;
=== src/SceneManager.cs
181:		if ((Input.GetKeyDown(KeyCode.Escape) || Input.GetButtonDown("Start")) && !welcomeScreenPanel.activeInHierarchy)
240:		Cursor.visible = true;
241:		Cursor.lockState = CursorLockMode.None;
253:		Cursor.visible = false;
254:		Cursor.lockState = CursorLockMode.Locked;
266:		Cursor.visible = false;
267:		Cursor.lockState = CursorLockMode.Locked;
327:		Cursor.visible = true;
328:		Cursor.lockState = CursorLockMode.None;
=== src/SkullBase.cs
176:			Cursor.lockState = CursorLockMode.None;
177:			Cursor.visible = true;
242:		Cursor.lockState = CursorLockMode.Locked;
243:		Cursor.visible = false;
267:		if (isInConvo && Input.GetMouseButtonDown(0) && !needReply && readyForNextDialogue)
=== src/Rewired.Integration.UnityUI/RewiredPointerInputModule.cs
41:		public ButtonState GetButtonState(int button)
66:			ButtonState buttonState = GetButtonState(button);
168:				return Cursor.lockState == CursorLockMode.Locked;
226:		bool IMouseInputSource.GetButtonDown(int button)
229:			return Input.GetMouseButtonDown(button);
232:		bool IMouseInputSource.GetButtonUp(int button)
235:			return Input.GetMouseButtonUp(button);
238:		bool IMouseInputSource.GetButton(int button)
241:			return Input.GetMouseButton(button);
765:		bool buttonDown = mouseInputSource.GetButtonDown(buttonId);
766:		bool buttonUp = mouseInputSource.GetButtonUp(buttonId);
=== src/Rewired.Integration.UnityUI/RewiredStandaloneInputModule.cs
624:				flag |= GetButtonDown(player, submitActionId);
625:				flag |= GetButtonDown(player, cancelActionId);
628:					flag |= GetButtonDown(player, horizontalActionId) || GetNegativeButtonDown(player, horizontalActionId);
629:					flag |= GetButtonDown(player, verticalActionId) || GetNegativeButtonDown(player, verticalActionId);
633:					flag |= !Mathf.Approximately(GetAxis(player, horizontalActionId), 0f);
634:					flag |= !Mathf.Approximately(GetAxis(player, verticalActionId), 0f);
641:			flag |= GetMouseButtonDownOnAnyMouse(0);
823:				if (GetButtonDown(player, submitActionId))
828:				if (GetButtonDown(player, cancelActionId))
852:			float num = GetAxis(player, horizontalActionId);
853:			float num2 = GetAxis(player, verticalActionId);
864:				if (GetButtonDown(player, horizontalActionId) && num > 0f)
872:				if (GetButtonDown(player, verticalActionId) && num2 > 0f)
883:				if (GetButton(player, horizontalActionId) && num > 0f)
891:				if (GetButton(player, verticalActionId) && num2 > 0f)
923:			axisEventData = GetAxisEventData(rawMoveVector.x, rawMoveVector.y, 0f);
937:			axisEventData = GetAxisEventData(rawMoveVector.x, rawMoveVector.y, 0f);
969:				downHorizontal |= GetButtonDown(player, horizontalActionId) || GetNegativeButtonDown(player, horizontalActionId);
970:				downVertical |= GetButtonDown(player, verticalActionId) || GetNegativeButtonDown(player, verticalActionId);
998:		MouseButtonEventData eventData = mousePointerEventData.GetButtonState(0).eventData;
=== src/Rewired.Demos.CustomPlatform/MyPlatformInputSource.cs
34:				SetButtonValue(i, sourceJoystick.GetButtonValue(i));
38:				SetAxisValue(j, sourceJoystick.GetAxisValue(j));
=== src/Rewired.Demos.CustomPlatform/VibrationTest.cs
24:			if (player.GetButtonDown(action_motors[i]))
33:		if (player.GetButtonDown(action_stop))
=== src/Rewired.Demos.CustomPlatform/MyPlatformUnifiedKeyboardSource.cs
45:			SetKeyValue(keyCodes[i], Input.GetKey((KeyCode)keyCodes[i]));
=== src/Rewired.Demos.CustomPlatform/UnityInputJoystickSource.cs
49:		public bool GetButtonValue(int index)
59:			return Input.GetKey((KeyCode)(350 + unityIndex * 20 + index));
62:		public float GetAxisValue(int index)
72:			return Input.GetAxis("Joy" + (unityIndex + 1) + "Axis" + (index + 1));
=== src/Rewired.Demos.CustomPlatform/MyPlatformUnifiedMouseSource.cs
12:		SetAxisValue(0, Input.GetAxis("MouseAxis1"));
13:		SetAxisValue(1, Input.GetAxis("MouseAxis2"));
14:		SetAxisValue(2, Input.GetAxis("MouseAxis3"));
15:		SetButtonValue(0, Input.GetButton("MouseButton0"));
16:		SetButtonValue(1, Input.GetButton("MouseButton1"));
17:		SetButtonValue(2, Input.GetButton("MouseButton2"));
18:		SetButtonValue(3, Input.GetButton("MouseButton3"));
19:		SetButtonValue(4, Input.GetButton("MouseButton4"));
20:		SetButtonValue(5, Input.GetButton("MouseButton5"));
21:		SetButtonValue(6, Input.GetButton("MouseButton6"));
=== src/SkullMan.cs
288:		Cursor.visible = true;
289:		Cursor.lockState = CursorLockMode.None;
316:		Cursor.lockState = CursorLockMode.None;
317:		Cursor.visible = true;
565:		Cursor.visible = false;
566:		Cursor.lockState = CursorLockMode.Locked;
=== src/Rewired.Demos/ControlRemappingDemo1.cs
635:		if (!dialog.enabled && Event.current.type == EventType.Layout && ReInput.players.GetSystemPlayer().GetButtonDown("Menu"))
1243:			float axisRawById = calibration.joystick.GetAxisRawById(calibration.selectedElementIdentifierId);
1245:			int axisIndexById = calibration.joystick.GetAxisIndexById(calibration.selectedElementIdentifierId);
1246:			AxisCalibration axis = calibration.calibrationMap.GetAxis(axisIndexById);
1247:			GUILayout.Label("Calibrated Value: " + calibration.joystick.GetAxisById(calibration.selectedElementIdentifierId));
=== src/Rewired.Demos/PressStartToJoinExample_Assigner.cs
61:			if (ReInput.players.GetPlayer(i).GetButtonDown("JoinGame"))
=== src/Rewired.Demos/EightPlayersExample_Player.cs
55:		moveVector.x = player.GetAxis("Move Horizontal");
56:		moveVector.y = player.GetAxis("Move Vertical");
57:		fire = player.GetButtonDown("Fire");
=== src/Rewired.Demos/CustomControllerDemo.cs
63:			controller.SetAxisUpdateCallback(GetAxisValueCallback);
64:			controller.SetButtonUpdateCallback(GetButtonValueCallback);
127:	private float GetAxisValueCallback(int index)
136:	private bool GetButtonValueCallback(int index)
=== src/Rewired.Demos/CustomControllerDemo_Player.cs
42:			Vector2 vector = new Vector2(player.GetAxis("Move Horizontal"), player.GetAxis("Move Vertical"));
44:			if (player.GetButtonDown("Fire"))
51:			if (player.GetButtonDown("Change Color"))
=== src/Rewired.Demos/CustomControllersTiltDemo.cs
29:			zero.y = player.GetAxis("Tilt Vertical");
30:			zero.x = player.GetAxis("Tilt Horizontal");
=== src/Rewired.Demos/DualShock4SpecialFeaturesExample.cs
56:		if (player.GetButtonDown("CycleLight"))
60:		if (player.GetButtonDown("ResetOrientation"))
64:		if (player.GetButtonDown("ToggleLightFlash"))
76:		if (player.GetButtonDown("VibrateLeft"))
80:		if (player.GetButtonDown("VibrateRight"))
=== src/Rewired.Demos/PressStartToJoinExample_GamePlayer.cs
41:		moveVector.x = player.GetAxis("Move Horizontal");
42:		moveVector.y = player.GetAxis("Move Vertical");
43:		fire = player.GetButtonDown("Fire");
=== src/Rewired.Demos/PressAnyButtonToJoinExample_GamePlayer.cs
51:		moveVector.x = player.GetAxis("Move Horizontal");
52:		moveVector.y = player.GetAxis("Move Vertical");
53:		fire = player.GetButtonDown("Fire");
=== src/FirstPersonController.cs
150:			Cursor.lockState = CursorLockMode.Locked;
195:			yaw = base.transform.localEulerAngles.y + Input.GetAxis("Mouse X") * mouseSensitivity;
198:				pitch -= mouseSensitivity * Input.GetAxis("Mouse Y");
202:				pitch += mouseSensitivity * Input.GetAxis("Mouse Y");
210:			if (Input.GetKeyDown(zoomKey) && !holdToZoom && !isSprinting)
223:				if (Input.GetKeyDown(zoomKey))
227:				else if (Input.GetKeyUp(zoomKey))
292:		Vector3 direction = new Vector3(Input.GetAxis("Horizontal"), 0f, Input.GetAxis("Vertical"));
301:		if (enableSprint && Input.GetKey(sprintKey) && sprintRemaining > 0f && !isSprintCooldown)
=== src/Rewired.UI.ControlMapper/CalibrationWindow.cs
142:			return joystick.calibrationMap.GetAxis(selectedAxis);
444:		float axis = joystick.GetAxis(selectedAxis);
445:		float num = Mathf.Clamp(joystick.GetAxisRaw(selectedAxis), -1f, 1f);
492:				GetAxisButtonDeadZone(playerId, menuHorizActionId, ref minSensitivity);
496:				GetAxisButtonDeadZone(playerId, menuVertActionId, ref minSensitivity);
538:	private void GetAxisButtonDeadZone(int playerId, int actionId, ref float value)
=== src/Rewired.UI.ControlMapper/LanguageDataBase.cs
109:	public abstract string GetKeyboardElementAssignmentPollingWindowMessage(string actionName);
=== src/Rewired.UI.ControlMapper/ControlMapper.cs
1094:				data = joystick.calibrationMap.GetAxis(axisIndex).GetData();
1128:				AxisCalibration axisCalibration = joystick.calibrationMap.GetAxis(axisIndex);
4475:				window.AddContentText(prefabs.windowContentText, UIPivot.TopCenter, UIAnchor.TopHStretch, new Vector2(0f, -100f), _language.GetKeyboardElementAssignmentPollingWindowMessage(pendingInputMapping.actionName));
5908:			if (ReInput.controllers.Keyboard.GetKeyDown(controllerPollingInfo.keyboardKey))
5928:				if (ReInput.controllers.Keyboard.GetKeyTimePressed(controllerPollingInfo2.keyboardKey) > 1.0)
5934:					label = Keyboard.GetKeyName(controllerPollingInfo2.keyboardKey);
