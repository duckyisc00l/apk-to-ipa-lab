using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using UnityEngine;
using UnityEngine.SceneManagement;
using UnityEngine.UIElements;

namespace UniInject
{
	public static class CheckingUtils
	{
		public static int CheckCurrentScene()
		{
			int num = 0;
			GameObject[] rootGameObjects = SceneManager.GetActiveScene().GetRootGameObjects();
			List<IBinding> list = new List<IBinding>();
			GameObject[] array = rootGameObjects;
			for (int i = 0; i < array.Length; i++)
			{
				List<IBinding> collection = FindBindings(array[i]);
				list.AddRange(collection);
			}
			AddBindingsForExistingVisualElements(list);
			array = rootGameObjects;
			for (int i = 0; i < array.Length; i++)
			{
				MonoBehaviour[] componentsInChildren = array[i].GetComponentsInChildren<MonoBehaviour>();
				foreach (MonoBehaviour script in componentsInChildren)
				{
					num += CheckScript(script, list);
				}
			}
			return num;
		}

		private static void AddBindingsForExistingVisualElements(List<IBinding> bindings)
		{
			GameObject gameObject = GameObject.FindGameObjectWithTag("UIDocument");
			if (!(gameObject == null))
			{
				UIDocument component = gameObject.GetComponent<UIDocument>();
				if (!(component == null))
				{
					AddBindingsForExistingVisualElementsRecursively(bindings, component.rootVisualElement);
				}
			}
		}

		private static void AddBindingsForExistingVisualElementsRecursively(List<IBinding> bindings, VisualElement visualElement)
		{
			if (!string.IsNullOrEmpty(visualElement.name))
			{
				bindings.Add(new Binding("#" + visualElement.name, null));
			}
			IEnumerable<string> classes = visualElement.GetClasses();
			if (classes != null)
			{
				foreach (string item in classes)
				{
					bindings.Add(new Binding("." + item, null));
				}
			}
			if (visualElement.childCount <= 0)
			{
				return;
			}
			foreach (VisualElement item2 in visualElement.Children())
			{
				AddBindingsForExistingVisualElementsRecursively(bindings, item2);
			}
		}

		private static int CheckScript(MonoBehaviour script, List<IBinding> bindings)
		{
			int num = 0;
			Type type = script.GetType();
			MemberInfo[] members = type.GetMembers(BindingFlags.Instance | BindingFlags.Public | BindingFlags.NonPublic);
			num += CheckInjectable(script, type, bindings);
			MemberInfo[] array = members;
			foreach (MemberInfo memberInfo in array)
			{
				num += CheckInjectedInInspectorAttribute(script, type, memberInfo);
			}
			return num;
		}

		private static int CheckInjectable(MonoBehaviour script, Type type, List<IBinding> bindings)
		{
			int num = 0;
			foreach (InjectionData injectionData in UniInjectUtils.GetInjectionDatas(type))
			{
				if (!injectionData.isOptional)
				{
					num = ((injectionData.searchMethod != SearchMethods.SearchInBindings) ? (num + CheckInjectableFromUnitySearchMethod(script, type, injectionData)) : (num + CheckInjectableFromBindings(script, type, bindings, injectionData)));
				}
			}
			return num;
		}

		private static int CheckInjectableFromUnitySearchMethod(MonoBehaviour script, Type type, InjectionData injectionData)
		{
			if (injectionData.InjectionKeys.Length > 1)
			{
				LogErrorCannotBeInjected($"The search method {injectionData.searchMethod} can only be used on a field or property.", script, type, injectionData.MemberInfo);
				return 1;
			}
			object obj = injectionData.InjectionKeys[0];
			if (!(obj is Type))
			{
				LogErrorCannotBeInjected($"The search method {injectionData.searchMethod} can not be used with a custom key.", script, type, injectionData.MemberInfo);
				return 1;
			}
			Type type2 = obj as Type;
			if (UniInjectUtils.InvokeUnitySearchMethod(script, injectionData.searchMethod, type2) == null)
			{
				LogErrorCannotBeInjected($"No instance of {type2} found using {injectionData.searchMethod}.", script, type, injectionData.MemberInfo);
				return 1;
			}
			return 0;
		}

		private static int CheckInjectableFromBindings(MonoBehaviour script, Type type, List<IBinding> bindings, InjectionData injectionData)
		{
			HashSet<Type> ignoredTypes = new HashSet<Type> { typeof(Injector) };
			foreach (object key in injectionData.InjectionKeys.Where((object it) => !ignoredTypes.Contains(it)))
			{
				List<IBinding> list = bindings.Where((IBinding binding) => object.Equals(binding.GetKey(), key)).ToList();
				if (list.Count == 0)
				{
					LogErrorCannotBeInjected($"Missing binding for key {key}", script, type, injectionData.MemberInfo);
					return 1;
				}
				if (list.Count > 1)
				{
					LogErrorCannotBeInjected($"Multiple bindings for key {key}", script, type, injectionData.MemberInfo);
					return 1;
				}
			}
			return 0;
		}

		private static int CheckInjectedInInspectorAttribute(MonoBehaviour script, Type type, MemberInfo memberInfo)
		{
			if (memberInfo.GetCustomAttribute<InjectedInInspectorAttribute>() == null)
			{
				return 0;
			}
			object obj = null;
			if (memberInfo is FieldInfo)
			{
				obj = (memberInfo as FieldInfo).GetValue(script);
			}
			else
			{
				if (!(memberInfo is PropertyInfo))
				{
					return 0;
				}
				obj = (memberInfo as PropertyInfo).GetValue(script);
			}
			if (obj == null || obj.ToString() == "null")
			{
				Debug.LogError("<b>" + type.Name + "." + memberInfo.Name + "</b> of " + script.name + " is null.\nIf this is intended then remove the InjectedInInspector attribute.", script);
				return 1;
			}
			return 0;
		}

		private static void LogErrorCannotBeInjected(string reason, MonoBehaviour script, Type type, MemberInfo memberInfo)
		{
			Debug.LogError("<b>" + type.Name + "." + memberInfo.Name + "</b> of " + script.name + " cannot be injected. " + reason, script);
		}

		private static List<IBinding> FindBindings(GameObject rootObject)
		{
			List<IBinding> list = new List<IBinding>();
			IBinder[] componentsInChildren = rootObject.GetComponentsInChildren<IBinder>();
			for (int i = 0; i < componentsInChildren.Length; i++)
			{
				List<IBinding> bindings = componentsInChildren[i].GetBindings();
				list.AddRange(bindings);
			}
			return list;
		}
	}
}
