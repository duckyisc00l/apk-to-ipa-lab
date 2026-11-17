using UnityEngine;

// Turns the camera with the phone (gyroscope), so enemies stay put in the room around you.
// In the editor, the mouse turns it instead.
public class CameraRotator : MonoBehaviour
{
	private float mouseY;
	private float mouseX;
	private GameObject cameraContainer;
	private Quaternion calibrationRotation;

	private void Awake()
	{
		cameraContainer = new GameObject("Camera Container");
		cameraContainer.transform.position = transform.position;
		transform.SetParent(cameraContainer.transform);
		calibrationRotation = Quaternion.Euler(90f, 0f, 0f);   // gyro "flat on the table" -> camera looking forward
	}

	private void Start()
	{
		if (SystemInfo.supportsGyroscope) Input.gyro.enabled = true;
		cameraContainer.transform.rotation = calibrationRotation;
	}

	private void Update()
	{
		if (SystemInfo.supportsGyroscope)
		{
			var q = Input.gyro.attitude;
			transform.localRotation = new Quaternion(q.x, q.y, -q.z, -q.w);   // right-handed device -> Unity
		}
		else
		{
			mouseX += Input.GetAxis("Mouse X") * 3f;
			mouseY = Mathf.Clamp(mouseY - Input.GetAxis("Mouse Y") * 3f, -80f, 80f);
			cameraContainer.transform.rotation = Quaternion.Euler(mouseY, mouseX, 0f);
			transform.localRotation = Quaternion.identity;
		}
	}
}
