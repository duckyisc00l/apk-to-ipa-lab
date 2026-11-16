using UnityEngine;
using UnityEngine.SceneManagement;

public static class GameObjectUtils
{
	public static T FindComponentWithTag<T>(string tag)
	{
		GameObject gameObject = GameObject.FindGameObjectWithTag(tag);
		if ((bool)gameObject)
		{
			T component = gameObject.GetComponent<T>();
			if (component == null)
			{
				Debug.LogError($"Did not find Component '{typeof(T)}' in GameObject with tag '{tag}'.", gameObject);
			}
			return component;
		}
		return default;
	}

	public static T FindObjectOfType<T>(bool includeInactive) where T : class
	{
		GameObject[] rootGameObjects = SceneManager.GetActiveScene().GetRootGameObjects();
		for (int i = 0; i < rootGameObjects.Length; i++)
		{
			T componentInChildren = rootGameObjects[i].GetComponentInChildren<T>(includeInactive);
			if (componentInChildren != null)
			{
				return componentInChildren;
			}
		}
		return null;
	}

	public static void DestroyAllDirectChildren(this Transform transform)
	{
		foreach (Transform item in transform)
		{
			Object.Destroy(item.gameObject);
		}
	}

	public static T GetOrAddComponent<T>(GameObject gameObject) where T : Component
	{
		T val = gameObject.GetComponent<T>();
		if (val == null)
		{
			val = gameObject.AddComponent<T>();
		}
		return val;
	}

	public static void Destroy(Object obj)
	{
		if (Application.isEditor && !Application.isPlaying)
		{
			Object.DestroyImmediate(obj);
		}
		else
		{
			Object.Destroy(obj);
		}
	}

	public static void SetTopLevelGameObjectAndDontDestroyOnLoad(GameObject gameObject)
	{
		gameObject.transform.SetParent(null);
		Object.DontDestroyOnLoad(gameObject);
	}

	public static void TryInitSingleInstanceWithDontDestroyOnLoad<T>(ref T staticInstance, ref T selfInstance, bool onlyInPlayMode = true) where T : MonoBehaviour
	{
		if (!(!Application.isPlaying & onlyInPlayMode))
		{
			if (staticInstance != null && staticInstance != selfInstance)
			{
				Object.Destroy(selfInstance.gameObject);
				return;
			}
			staticInstance = selfInstance;
			selfInstance.transform.SetParent(null);
			Object.DontDestroyOnLoad(selfInstance.gameObject);
		}
	}
}
