using System;
using System.Collections.Generic;
using UnityEngine;

public class DontDestroyOnLoadManager : AbstractSingletonBehaviour
{
	private static DontDestroyOnLoadManager instance;

	private readonly Dictionary<Type, Component> typeToComponentCache = new Dictionary<Type, Component>();

	public static DontDestroyOnLoadManager Instance
	{
		get
		{
			if (instance == null)
			{
				DontDestroyOnLoadManager selfInstance = GameObjectUtils.FindComponentWithTag<DontDestroyOnLoadManager>("DontDestroyOnLoadManager");
				if (selfInstance != null)
				{
					GameObjectUtils.TryInitSingleInstanceWithDontDestroyOnLoad(ref instance, ref selfInstance);
				}
			}
			return instance;
		}
	}

	protected override object GetInstance()
	{
		return Instance;
	}

	public T FindComponentOrThrow<T>() where T : Component
	{
		Type typeFromHandle = typeof(T);
		if (typeToComponentCache.TryGetValue(typeFromHandle, out var value))
		{
			return value as T;
		}
		T componentInChildren = GetComponentInChildren<T>();
		if (componentInChildren == null)
		{
			throw new UltraStarPlayException(string.Format("Did not find Component '{0}' in {1}", typeFromHandle, "DontDestroyOnLoadManager"));
		}
		typeToComponentCache[typeFromHandle] = componentInChildren;
		return componentInChildren;
	}
}
