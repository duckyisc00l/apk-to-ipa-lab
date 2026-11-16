using UnityEngine;

public abstract class AbstractSingletonBehaviour : MonoBehaviour
{
	protected abstract object GetInstance();

	protected virtual void AwakeSingleton()
	{
	}

	protected virtual void StartSingleton()
	{
	}

	protected virtual void OnEnableSingleton()
	{
	}

	protected virtual void OnDisableSingleton()
	{
	}

	protected virtual void OnDestroySingleton()
	{
	}

	private void Awake()
	{
		if (GetInstance() == this)
		{
			AwakeSingleton();
		}
		else
		{
			Object.Destroy(base.gameObject);
		}
	}

	private void OnEnable()
	{
		if (GetInstance() == this)
		{
			OnEnableSingleton();
		}
	}

	private void OnDisable()
	{
		if (GetInstance() == this)
		{
			OnDisableSingleton();
		}
	}

	private void Start()
	{
		if (GetInstance() == this)
		{
			StartSingleton();
		}
	}

	private void OnDestroy()
	{
		if (GetInstance() == this)
		{
			OnDestroySingleton();
		}
	}
}
