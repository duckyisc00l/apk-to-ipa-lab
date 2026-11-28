## script files
138
## input calls (file: call)
     54 ReInput.isReady
     53 ReInput.players.GetPlayer
     30 ReInput.mapping.GetAction
     25 ReInput.players.AllPlayers
     11 ReInput.controllers.Joysticks
     10 ReInput.mapping.GetActionId
      9 ReInput.players.Players
      9 ReInput.controllers.joystickCount
      9 Input.GetAxis
      8 ReInput.mapping.GetMapCategory
      8 ReInput.InitializedEvent
      8 ReInput.ControllerDisconnectedEvent
      8 ReInput.ControllerConnectedEvent
      7 ReInput.mapping.GetActionCategory
      7 ReInput.localization.localizedStringProvider
      6 ReInput.mapping.GetInputBehavior
      6 ReInput.glyphs.glyphProvider
      6 ReInput.controllers.GetJoystick
      6 Cursor.lockState = CursorLockMode.Locked
      5 ReInput.players.allPlayerCount
      5 ReInput.mapping.UserAssignableActionsInCategory
      5 ReInput.controllers.GetController
      5 Cursor.lockState = CursorLockMode.None
      4 ReInput.unityJoystickIdentificationRequired
      4 ReInput.time.unscaledTime
      4 ReInput.players.playerCount
      4 ReInput.mapping.Actions
      4 ReInput.controllers.IsControllerAssigned
      4 GetButtonDown("Fire"
      4 GetAxis("Move Vertical"
      4 GetAxis("Move Horizontal"
      3 ReInput.userDataStore.SaveControllerData
      3 ReInput.userDataStore.LoadControllerData
      3 ReInput.userDataStore
      3 ReInput.players.SystemPlayer.controllers.conflictChecking.ElementAssignmentConflicts
      3 ReInput.players.GetSystemPlayer
      3 ReInput.mapping.ActionsInCategory
      3 ReInput.configuration.autoAssignJoysticks
      3 ReInput.ShutDownEvent
      3 ReInput.EditorRecompileEvent
      3 ReInput.ControllerPreDisconnectEvent
      3 Input.mousePosition
      2 ReInput.userDataStore.Save
      2 ReInput.players.SystemPlayer
      2 ReInput.mapping.MapLayouts
      2 ReInput.mapping.MapCategories
      2 ReInput.mapping.GetInputBehaviors
      2 ReInput.mapping.GetControllerMapInstance
      2 ReInput.localization.prefetch
      2 ReInput.glyphs.prefetch
      2 ReInput.controllers.polling.PollControllerForFirstElementDown
      2 ReInput.controllers.polling.PollControllerForFirstButtonDown
      2 ReInput.controllers.conflictChecking.ElementAssignmentConflicts
      2 ReInput.controllers.SetUnityJoystickIdFromAnyButtonOrAxisPress
      2 ReInput.controllers.Mouse
      2 ReInput.controllers.Keyboard
      2 ReInput.controllers.AutoAssignJoysticks
      2 ReInput.InputSourceUpdateEvent
      1 ReInput.userDataStore.Load
      1 ReInput.players.SystemPlayer.controllers.conflictChecking.DoesElementAssignmentConflict
      1 ReInput.players.GetPlayers
      1 ReInput.mapping.UserAssignableMapCategories
      1 ReInput.mapping.GetLayout
      1 ReInput.mapping.GetActionElementMap
      1 ReInput.localization.Reload
      1 ReInput.glyphs.Reload
      1 ReInput.controllers.polling.PollControllerForAllElementsDown
      1 ReInput.controllers.polling.PollAllControllersOfTypeForFirstElementDown
      1 ReInput.controllers.conflictChecking.DoesElementAssignmentConflict
      1 ReInput.controllers.Mouse.name
      1 ReInput.controllers.Mouse.enabled
      1 ReInput.controllers.Keyboard.name
      1 ReInput.controllers.Keyboard.enabled
      1 ReInput.controllers.Keyboard.PollForAllKeys
      1 ReInput.controllers.Keyboard.GetKeyTimePressed
      1 ReInput.controllers.Keyboard.GetKeyDown
      1 ReInput.controllers.IsJoystickAssigned
      1 ReInput.controllers.GetJoysticks
      1 ReInput.configuration.ignoreInputWhenAppNotInFocus
      1 KeyCode.Space
      1 KeyCode.None
      1 KeyCode.Mouse1
      1 KeyCode.LeftShift
      1 KeyCode.LeftControl
      1 KeyCode.Escape
      1 KeyCode.D
      1 KeyCode.C
      1 KeyCode.B
      1 KeyCode.AltGr
      1 KeyCode.A
      1 Input.touchCount
      1 GetButtonDown("VibrateRight"
      1 GetButtonDown("VibrateLeft"
      1 GetButtonDown("ToggleLightFlash"
      1 GetButtonDown("Start"
      1 GetButtonDown("ResetOrientation"
      1 GetButtonDown("Menu"
      1 GetButtonDown("JoinGame"
      1 GetButtonDown("CycleLight"
      1 GetButtonDown("Change Color"
      1 GetButton("MouseButton6"
      1 GetButton("MouseButton5"
      1 GetButton("MouseButton4"
      1 GetButton("MouseButton3"
      1 GetButton("MouseButton2"
      1 GetButton("MouseButton1"
      1 GetButton("MouseButton0"
      1 GetAxis("Tilt Vertical"
      1 GetAxis("Tilt Horizontal"
## rewired action ids
	public const int elementId_stickX = 0;
	public const int elementId_stickY = 1;
	public const int elementId_stickRotate = 2;
	public const int elementId_stickTrigger = 3;
	public const int elementId_stickPinkyButton = 5;
	public const int elementId_stickPinkyTrigger = 154;
	public const int elementId_throttleMiniStickX = 75;
	public const int elementId_throttleMiniStickY = 76;
	public const int elementId_throttleMiniStickPress = 77;
	public const int elementId_leftPedal = 168;
	public const int elementId_rightPedal = 169;
	public const int elementId_slidePedals = 170;
	public const int elementId_stick = 171;
	public const int elementId_throttleMiniStick = 180;
	public const int elementId_wheel = 0;
	public const int elementId_accelerator = 1;
	public const int elementId_brake = 2;
	public const int elementId_clutch = 3;
	public const int elementId_shiftDown = 4;
	public const int elementId_shiftUp = 5;
	public const int elementId_reverseGear = 44;
	public const int elementId_select = 36;
	public const int elementId_start = 37;
	public const int elementId_systemButton = 38;
	public const int elementId_horn = 43;
	public const int elementId_dPadUp = 39;
	public const int elementId_dPadRight = 40;
	public const int elementId_dPadDown = 41;
	public const int elementId_dPadLeft = 42;
	public const int elementId_dPad = 45;
	public const int elementId_leftPedal = 0;
	public const int elementId_rightPedal = 1;
	public const int elementId_slide = 2;
	public const int elementId_positionX = 1;
	public const int elementId_positionY = 2;
	public const int elementId_positionZ = 0;
	public const int elementId_rotationX = 3;
	public const int elementId_rotationY = 5;
	public const int elementId_rotationZ = 4;
	public const int elementId_stick = 54;
	public const int elementId_rotateYoke = 0;
	public const int elementId_yokeZ = 1;
	public const int elementId_leftPaddle = 59;
	public const int elementId_rightPaddle = 60;
	public const int elementId_leftGripHatUp = 27;
	public const int elementId_leftGripHatUpRight = 28;
	public const int elementId_leftGripHatRight = 29;
	public const int elementId_leftGripHatDownRight = 30;
	public const int elementId_leftGripHatDown = 31;
	public const int elementId_leftGripHatDownLeft = 32;
	public const int elementId_leftGripHatLeft = 33;
	public const int elementId_leftGripHatUpLeft = 34;
	public const int elementId_rightGripHatUp = 35;
	public const int elementId_rightGripHatUpRight = 36;
	public const int elementId_rightGripHatRight = 37;
	public const int elementId_rightGripHatDownRight = 38;
	public const int elementId_rightGripHatDown = 39;
	public const int elementId_rightGripHatDownLeft = 40;
	public const int elementId_rightGripHatLeft = 41;
	public const int elementId_rightGripHatUpLeft = 42;
grep: write error: Broken pipe
## per file
src/Rewired.Demos.GamepadTemplateUI/GamepadTemplateUI.cs
src/SceneManager.cs
src/SkullBase.cs
src/Rewired.Integration.UnityUI/RewiredPointerInputModule.cs
src/Rewired.Integration.UnityUI/RewiredStandaloneInputModule.cs
src/Rewired.Demos.CustomPlatform/MyPlatformInputSource.cs
src/Rewired.Demos.CustomPlatform/VibrationTest.cs
src/Rewired.Demos.CustomPlatform/MyPlatformUnifiedKeyboardSource.cs
src/Rewired.Demos.CustomPlatform/UnityInputJoystickSource.cs
src/Rewired.Demos.CustomPlatform/MyPlatformUnifiedMouseSource.cs
src/Rewired.Demos/ControlRemappingDemo1.cs
src/Rewired.Demos/PressStartToJoinExample_Assigner.cs
src/Rewired.Demos/EightPlayersExample_Player.cs
src/Rewired.Demos/CustomControllerDemo.cs
src/Rewired.Demos/CustomControllerDemo_Player.cs
src/Rewired.Demos/CustomControllersTiltDemo.cs
src/Rewired.Demos/DualShock4SpecialFeaturesExample.cs
src/Rewired.Demos/PressStartToJoinExample_GamePlayer.cs
src/Rewired.Demos/PressAnyButtonToJoinExample_GamePlayer.cs
src/FirstPersonController.cs
src/Rewired.UI.ControlMapper/CalibrationWindow.cs
src/Rewired.UI.ControlMapper/LanguageDataBase.cs
src/Rewired.UI.ControlMapper/ControlMapper.cs
src/Rewired.UI.ControlMapper/LanguageData.cs
src/ObjectsObserver.cs
## class list
ActionDialogue.cs
AssemblyInfo.cs
Bullet.cs
ButtonBehavior.cs
ButtonInfo.cs
CalibrationWindow.cs
CanvasScalerExt.cs
CanvasScalerFitter.cs
ControlMapper.cs
ControlMapperDemoMessage.cs
ControlRemappingDemo1.cs
ControllerElementGlyph.cs
ControllerElementGlyphBase.cs
ControllerElementGlyphSelectorOptions.cs
ControllerElementGlyphSelectorOptionsSO.cs
ControllerElementGlyphSelectorOptionsSOBase.cs
ControllerTemplateFactory.cs
ControllerUIEffect.cs
ControllerUIElement.cs
Convo.cs
ConvoCollection.cs
CustomButton.cs
CustomControllerDemo.cs
CustomControllerDemo_Player.cs
CustomControllersTiltDemo.cs
CustomPlatformHardwareJoystickMapPlatformDataSet.cs
CustomPlatformHardwareJoystickMapProvider.cs
CustomPlatformManager.cs
CustomPlatformType.cs
CustomSlider.cs
CustomToggle.cs
CutSceneManager.cs
DefaultControllerElementGlyphSettingsBase.cs
DiscordController.cs
DualShock4SpecialFeaturesExample.cs
EightPlayersExample_Player.cs
EventTrigger.cs
ExternalTools.cs
FallbackJoystickIdentificationDemo.cs
FirstPersonController.cs
FlightPedalsTemplate.cs
FlightYokeTemplate.cs
GameProgressManager.cs
GamepadTemplate.cs
GamepadTemplateUI.cs
GlyphOrTextBase.cs
GlyphProvider.cs
GlyphSet.cs
GlyphSetCollection.cs
GlyphTools.cs
HOTASTemplate.cs
ICustomSelectable.cs
IFlightPedalsTemplate.cs
IFlightYokeTemplate.cs
IGamepadTemplate.cs
IHOTASTemplate.cs
IRacingWheelTemplate.cs
ISixDofControllerTemplate.cs
InputBehaviorWindow.cs
InputFieldInfo.cs
InputManager.cs
InputRow.cs
ItemPositionDictionaryManager.cs
Kop.cs
LanguageData.cs
LanguageDataBase.cs
LocalizedStringProvider.cs
LocalizedStringProviderBase.cs
MissionManager.cs
MyPlatformControllerExtension.cs
MyPlatformControllerIdentifier.cs
MyPlatformHardwareJoystickMapPlatformMap.cs
MyPlatformInputSource.cs
MyPlatformUnifiedKeyboardSource.cs
MyPlatformUnifiedMouseSource.cs
ObjectsObserver.cs
PartySkull.cs
Player.cs
PlayerMouseSpriteExample.cs
PlayerPointerEventData.cs
PlayerPointerEventHandlerExample.cs
PointerEventType.cs
PressAnyButtonToJoinExample_Assigner.cs
PressAnyButtonToJoinExample_GamePlayer.cs
PressStartToJoinExample_Assigner.cs
PressStartToJoinExample_GamePlayer.cs
RacingWheelTemplate.cs
RewiredEventSystem.cs
RewiredPointerInputModule.cs
RewiredStandaloneInputModule.cs
SceneManager.cs
SceneStateManager.cs
ScrollRectSelectableChild.cs
ScrollbarVisibilityHelper.cs
SimpleCombinedKeyboardMouseRemapping.cs
SimpleControlRemapping.cs
SixDofControllerTemplate.cs
Skooly.cs
SkullBase.cs
SkullCollisionManager.cs
SkullInTraining.cs
SkullMan.cs
SkullsManager.cs
SpeechManager.cs
SpriteGlyphSet.cs
SteamManager.cs
ThemeSettings.cs
ThemedElement.cs
ToggleInfo.cs
TouchButtonExample.cs
TouchJoystickExample.cs
UIControl.cs
UIControlSet.cs
UIElementInfo.cs
UIGroup.cs
UIImageHelper.cs
UIPointer.cs
UISelectionUtility.cs
UISliderControl.cs
UITools.cs
UnityInputJoystickSource.cs
UnitySourceGeneratedAssemblyMonoScriptTypes_v1.cs
UnityUIControllerElementGlyph.cs
UnityUIControllerElementGlyphBase.cs
UnityUIDefaultControllerElementGlyphSettings.cs
UnityUIDefaultGlyphOrTextTMProPrefabProvider.cs
UnityUIGlyphOrText.cs
UnityUIGlyphOrTextTMPro.cs
UnityUIPlayerControllerElementGlyph.cs
UnityUIPlayerControllerElementGlyphBase.cs
UnityUITextMeshProGlyphHelper.cs
UserDataStore_File.cs
UserDataStore_KeyValue.cs
UserDataStore_PlayerPrefs.cs
VibrationTest.cs
WindmillBladeRotation.cs
Window.cs
WobblyCamera.cs
## data strings
      2 Flash Light
      1 SprintBar
      1 Pause Menu
      1 Look away spot
      1 Interaction Text
      1 Interaction Panel
      3 Jump
      2 Submit
      1 Vertical
      1 Mouse Y
      1 Mouse X
      1 Interactable
      1 Horizontal
      1 Cancel
      1 Use Alpha Clip
