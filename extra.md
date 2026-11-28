FirstPersonController: 10:	public float fov = 60f;
FirstPersonController: 12:	public bool invertCamera;
FirstPersonController: 14:	public bool cameraCanMove = true;
FirstPersonController: 16:	public float mouseSensitivity = 2f;
FirstPersonController: 18:	public float maxLookAngle = 50f;
FirstPersonController: 20:	public bool lockCursor = true;
FirstPersonController: 22:	public bool crosshair = true;
FirstPersonController: 34:	public bool enableZoom = true;
FirstPersonController: 36:	public bool holdToZoom;
FirstPersonController: 38:	public KeyCode zoomKey = KeyCode.Mouse1;
FirstPersonController: 40:	public float zoomFOV = 30f;
FirstPersonController: 42:	public float zoomStepTime = 5f;
FirstPersonController: 46:	public bool playerCanMove = true;
FirstPersonController: 48:	public float walkSpeed = 5f;
FirstPersonController: 50:	public float maxVelocityChange = 10f;
FirstPersonController: 52:	public bool isWalking;
FirstPersonController: 54:	public bool enableSprint = true;
FirstPersonController: 56:	public bool unlimitedSprint;
FirstPersonController: 58:	public KeyCode sprintKey = KeyCode.LeftShift;
FirstPersonController: 60:	public float sprintSpeed = 7f;
FirstPersonController: 62:	public float sprintDuration = 5f;
FirstPersonController: 64:	public float sprintCooldown = 0.5f;
FirstPersonController: 66:	public float sprintFOV = 80f;
FirstPersonController: 68:	public float sprintFOVStepTime = 10f;
FirstPersonController: 70:	public bool useSprintBar = true;
FirstPersonController: 72:	public bool hideBarWhenFull = true;
FirstPersonController: 78:	public float sprintBarWidthPercent = 0.3f;
FirstPersonController: 80:	public float sprintBarHeightPercent = 0.015f;
FirstPersonController: 84:	public bool isSprinting;
FirstPersonController: 96:	public bool enableJump = true;
FirstPersonController: 98:	public KeyCode jumpKey = KeyCode.Space;
FirstPersonController: 100:	public float jumpPower = 5f;
FirstPersonController: 104:	public bool enableCrouch = true;
FirstPersonController: 106:	public bool holdToCrouch = true;
FirstPersonController: 108:	public KeyCode crouchKey = KeyCode.LeftControl;
FirstPersonController: 110:	public float crouchHeight = 0.75f;
FirstPersonController: 112:	public float speedReduction = 0.5f;
FirstPersonController: 118:	public bool enableHeadBob = true;
FirstPersonController: 122:	public float bobSpeed = 10f;
FirstPersonController: 148:		if (lockCursor)
FirstPersonController: 150:			Cursor.lockState = CursorLockMode.Locked;
FirstPersonController: 195:			yaw = base.transform.localEulerAngles.y + Input.GetAxis("Mouse X") * mouseSensitivity;
FirstPersonController: 198:				pitch -= mouseSensitivity * Input.GetAxis("Mouse Y");
FirstPersonController: 202:				pitch += mouseSensitivity * Input.GetAxis("Mouse Y");
FirstPersonController: 210:			if (Input.GetKeyDown(zoomKey) && !holdToZoom && !isSprinting)
FirstPersonController: 223:				if (Input.GetKeyDown(zoomKey))
FirstPersonController: 227:				else if (Input.GetKeyUp(zoomKey))
FirstPersonController: 292:		Vector3 direction = new Vector3(Input.GetAxis("Horizontal"), 0f, Input.GetAxis("Vertical"));
FirstPersonController: 301:		if (enableSprint && Input.GetKey(sprintKey) && sprintRemaining > 0f && !isSprintCooldown)
FirstPersonController: 345:		if (Physics.Raycast(vector, vector2, out var _, num))
ObjectsObserver: 7:	private RaycastHit hit;
ObjectsObserver: 25:	public bool handsReadyForNext;
ObjectsObserver: 43:		Physics.Raycast(base.transform.position, base.transform.forward, out hit, 2f, currentSearchMask);
ObjectsObserver: 48:			if (Input.GetMouseButtonDown(0))
ObjectsObserver: 83:		if (Input.GetMouseButtonDown(0) && hit.collider != null && hit.transform.gameObject.layer == 8 && currentHeldItem != null)
ObjectsObserver: 98:		else if (Input.GetMouseButtonDown(0) && hit.collider != null && hit.transform.gameObject.layer == 7)
ObjectsObserver: 102:		if (Input.GetMouseButtonDown(0) && currentHeldItem != null)
ObjectsObserver: 122:		else if (Input.GetMouseButtonDown(0) && hit.collider != null && hit.transform.gameObject.layer == 6 && handsReadyForNext)
Player: 20:	public float convoCameraRotattionSpeed;
Player: 25:	public bool havingConvo;
Player: 45:	public bool readyToAppearBehind;
Player: 47:	private RaycastHit behindHit;
Player: 63:		Cursor.visible = false;
Player: 64:		Cursor.lockState = CursorLockMode.Locked;
SceneManager: 31:	public bool lightsOff;
SceneManager: 125:	public float speechInterval = 0.05f;
SceneManager: 127:	public bool quickTest;
SceneManager: 139:	public bool windowsOpen;
SceneManager: 141:	public bool basketballHoopActive;
SceneManager: 181:		if ((Input.GetKeyDown(KeyCode.Escape) || Input.GetButtonDown("Start")) && !welcomeScreenPanel.activeInHierarchy)
SceneManager: 240:		Cursor.visible = true;
SceneManager: 241:		Cursor.lockState = CursorLockMode.None;
SceneManager: 253:		Cursor.visible = false;
SceneManager: 254:		Cursor.lockState = CursorLockMode.Locked;
SceneManager: 266:		Cursor.visible = false;
SceneManager: 267:		Cursor.lockState = CursorLockMode.Locked;
SceneManager: 327:		Cursor.visible = true;
SceneManager: 328:		Cursor.lockState = CursorLockMode.None;
SceneManager: 395:	public void OpenTheWindows(bool open)
SceneManager: 414:	public void ToggleBasketballHoop(bool activate)
SceneManager: 420:	public void IncreaseMouseSpeed()
SceneManager: 429:	public void DecreaseMouseSpeed()
SkullBase: 22:	public bool alreadyActive;
SkullBase: 26:	public float spinForce = 1f;
SkullBase: 28:	public bool continueWhereLeft;
SkullBase: 48:	public float startStoppingDistance;
SkullBase: 50:	public bool createDistance;
SkullBase: 76:	public bool isInConvo;
SkullBase: 78:	public bool needReply;
SkullBase: 80:	public float talkAnimDuration = 0.5f;
SkullBase: 84:	public bool readyForNextDialogue;
SkullBase: 90:	public bool speakNextDeeply;
SkullBase: 94:	public float voiceLowerEndPitch = 0.8f;
SkullBase: 96:	public float voiceUpperEndPitch = 1.1f;
SkullBase: 110:	public float letterInterval = 0.01f;
SkullBase: 112:	public virtual void SetupConvo(Convo convo, bool lockCamera = false)
SkullBase: 176:			Cursor.lockState = CursorLockMode.None;
SkullBase: 177:			Cursor.visible = true;
SkullBase: 242:		Cursor.lockState = CursorLockMode.Locked;
SkullBase: 243:		Cursor.visible = false;
SkullBase: 267:		if (isInConvo && Input.GetMouseButtonDown(0) && !needReply && readyForNextDialogue)
SkullMan: 21:	public float stabDistance;
SkullMan: 46:	private RaycastHit playerHit;
SkullMan: 66:	public bool readyToDisappear;
SkullMan: 68:	public bool readyToThenKill;
SkullMan: 70:	public bool readyToEndDemo;
SkullMan: 93:	public float appearBehindDelay = 20f;
SkullMan: 165:				Physics.Raycast(base.transform.position, (Player.Instance.transform.position - base.transform.position).normalized, out var hitInfo, 2f);
SkullMan: 211:			if (currentState == state.lookingToKill && Physics.Raycast(base.transform.position, (Player.Instance.transform.position - base.transform.position).normalized, out playerHit, 5f) && playerHit.transform.gameObject.layer == 9)
SkullMan: 288:		Cursor.visible = true;
SkullMan: 289:		Cursor.lockState = CursorLockMode.None;
SkullMan: 316:		Cursor.lockState = CursorLockMode.None;
SkullMan: 317:		Cursor.visible = true;
SkullMan: 414:	public override void SetupConvo(Convo convo, bool lockCamera = false)
SkullMan: 565:		Cursor.visible = false;
SkullMan: 566:		Cursor.lockState = CursorLockMode.Locked;
SkullMan: 584:	public void Disappear(bool thenKill = false)
