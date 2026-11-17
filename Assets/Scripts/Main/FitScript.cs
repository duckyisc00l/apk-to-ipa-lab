using UnityEngine;

// Scales the camera-feed plane so it exactly fills the view at its distance (no black edges).
public class FitScript : MonoBehaviour
{
	[SerializeField] private Camera cam;
	[SerializeField] private Transform planeObject;

	private void Start()
	{
		if (cam == null) cam = Camera.main;
		if (cam == null || planeObject == null) return;
		float distance = Vector3.Distance(cam.transform.position, planeObject.position);
		float height = 2f * distance * Mathf.Tan(cam.fieldOfView * 0.5f * Mathf.Deg2Rad);
		float width = height * cam.aspect;
		// Unity's plane mesh is 10x10 units; a quad is 1x1
		var mesh = planeObject.GetComponent<MeshFilter>();
		float size = mesh != null && mesh.sharedMesh != null ? mesh.sharedMesh.bounds.size.x : 10f;
		planeObject.localScale = new Vector3(width / size, 1f, height / size);
	}
}
