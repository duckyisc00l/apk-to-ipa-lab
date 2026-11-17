using System;
using System.Collections.Generic;
using System.Reflection;
using UnityEngine;

namespace UniInject
{
	public static class UniInjectUtils
	{
		private static class UniInjectGenericMethodHolder
		{
			public static T[] GetComponentsInChildren<T>(Component component, bool includeInactive) where T : Component
			{
				return component.GetComponentsInChildren<T>(includeInactive);
			}

			public static T[] GetComponentsInParent<T>(Component component, bool includeInactive) where T : Component
			{
				return component.GetComponentsInParent<T>(includeInactive);
			}

			public static T[] FindObjectsOfType<T>(bool includeInactive) where T : Component
			{
				return UnityEngine.Object.FindObjectsOfType<T>(includeInactive);
			}
		}

		private static readonly bool logDebugInfos;

		private static readonly Dictionary<Type, ConstructorInjectionData> typeToConstructorInjectionDataMap = new Dictionary<Type, ConstructorInjectionData>();

		private static readonly Dictionary<Type, List<InjectionData>> typeToInjectionDatasMap = new Dictionary<Type, List<InjectionData>>();

		public static Injector GlobalInjector { get; set; } = new Injector(null);

		public static ConstructorInjectionData GetConstructorInjectionData(Type type)
		{
			if (!typeToConstructorInjectionDataMap.TryGetValue(type, out var value))
			{
				value = ReflectionUtils.CreateConstructorInjectionData(type);
				typeToConstructorInjectionDataMap.Add(type, value);
			}
			return value;
		}

		public static List<InjectionData> GetInjectionDatas(Type type)
		{
			if (!typeToInjectionDatasMap.TryGetValue(type, out var value))
			{
				if (logDebugInfos)
				{
					Debug.Log("Loading injection data of type: " + type);
				}
				value = ReflectionUtils.CreateInjectionDatas(type);
				typeToInjectionDatasMap.Add(type, value);
			}
			return value;
		}

		public static Injector CreateInjector(Injector parent = null)
		{
			if (parent != null)
			{
				return new Injector(parent);
			}
			return new Injector(GlobalInjector);
		}

		public static void LoadInjectionDataForTypesInAssembly(Assembly assembly)
		{
			Type[] types = assembly.GetTypes();
			for (int i = 0; i < types.Length; i++)
			{
				GetInjectionDatas(types[i]);
			}
		}

		public static object InvokeUnitySearchMethod(MonoBehaviour script, SearchMethods searchMethod, Type componentType)
		{
			switch (searchMethod)
			{
			case SearchMethods.GetComponent:
				return script.GetComponent(componentType);
			case SearchMethods.GetComponentInChildren:
				return script.GetComponentInChildren(componentType);
			case SearchMethods.GetComponentInChildrenIncludeInactive:
				return script.GetComponentInChildren(componentType, includeInactive: true);
			case SearchMethods.GetComponentsInChildren:
				ThrowIfNonArrayType(componentType, searchMethod);
				return typeof(UniInjectGenericMethodHolder).GetMethod("GetComponentsInChildren").MakeGenericMethod(componentType.GetElementType()).Invoke(script, new object[2] { script, false });
			case SearchMethods.GetComponentsInChildrenIncludeInactive:
				ThrowIfNonArrayType(componentType, searchMethod);
				return typeof(UniInjectGenericMethodHolder).GetMethod("GetComponentsInChildren").MakeGenericMethod(componentType.GetElementType()).Invoke(script, new object[2] { script, true });
			case SearchMethods.GetComponentInParent:
				return script.GetComponentInParent(componentType);
			case SearchMethods.GetComponentInParentIncludeInactive:
				return script.GetComponentInParent(componentType, includeInactive: true);
			case SearchMethods.GetComponentsInParent:
				ThrowIfNonArrayType(componentType, searchMethod);
				return typeof(UniInjectGenericMethodHolder).GetMethod("GetComponentsInParent").MakeGenericMethod(componentType.GetElementType()).Invoke(script, new object[2] { script, false });
			case SearchMethods.GetComponentsInParentIncludeInactive:
				ThrowIfNonArrayType(componentType, searchMethod);
				return typeof(UniInjectGenericMethodHolder).GetMethod("GetComponentsInParent").MakeGenericMethod(componentType.GetElementType()).Invoke(script, new object[2] { script, true });
			case SearchMethods.FindObjectOfType:
				return UnityEngine.Object.FindObjectOfType(componentType);
			case SearchMethods.FindObjectOfTypeIncludeInactive:
				return UnityEngine.Object.FindObjectOfType(componentType, includeInactive: true);
			case SearchMethods.FindObjectsOfType:
				ThrowIfNonArrayType(componentType, searchMethod);
				return typeof(UniInjectGenericMethodHolder).GetMethod("FindObjectsOfType").MakeGenericMethod(componentType.GetElementType()).Invoke(script, new object[1] { false });
			case SearchMethods.FindObjectsOfTypeIncludeInactive:
				ThrowIfNonArrayType(componentType, searchMethod);
				return typeof(UniInjectGenericMethodHolder).GetMethod("FindObjectsOfType").MakeGenericMethod(componentType.GetElementType()).Invoke(script, new object[1] { true });
			default:
				throw new InjectionException($" Unknown Unity search method {searchMethod}");
			}
		}

		private static void ThrowIfNonArrayType(Type type, SearchMethods searchMethod)
		{
			if (!type.IsArray)
			{
				throw new InjectionException("SearchMethod " + searchMethod.ToString() + " requires an array type to be injected.");
			}
		}
	}
}
