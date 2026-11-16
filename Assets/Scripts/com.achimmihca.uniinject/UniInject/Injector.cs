using System;
using System.Collections.Generic;
using System.Reflection;
using UnityEngine;
using UnityEngine.UIElements;

namespace UniInject
{
	public class Injector
	{
		private class UnitySearchMethodMockup
		{
			public MonoBehaviour callingScript;

			public SearchMethods searchMethod;

			public object searchResult;

			public UnitySearchMethodMockup(MonoBehaviour callingScript, SearchMethods searchMethod, object mockup)
			{
				this.callingScript = callingScript;
				this.searchMethod = searchMethod;
				searchResult = mockup;
			}
		}

		private static class InjectorGenericMethodHolder
		{
			public static List<T> GetVisualElements<T>(VisualElement rootVisualElement, string elementName, string elementClass) where T : VisualElement
			{
				return rootVisualElement.Query<T>(elementName, elementClass).ToList();
			}
		}

		public const string RootVisualElementInjectionKey = "rootVisualElement";

		private readonly Dictionary<object, IProvider> injectionKeyToProviderMap = new Dictionary<object, IProvider>();

		private readonly HashSet<Type> getValuesForConstructorInjectionVisitedTypes = new HashSet<Type>();

		private readonly Dictionary<object, object> injectionKeyToObjectWithOngoingInjectionMap = new Dictionary<object, object>();

		private readonly List<UnitySearchMethodMockup> unitySearchMethodMockups = new List<UnitySearchMethodMockup>();

		private IProvider thisInstanceProvider;

		public Injector ParentInjector { get; private set; }

		public bool SearchInParentInjector { get; set; } = true;

		internal Injector(Injector parent)
		{
			ParentInjector = parent;
		}

		internal object Create(Type type)
		{
			object[] valuesForConstructorInjection = GetValuesForConstructorInjection(type);
			if (valuesForConstructorInjection == null)
			{
				return Activator.CreateInstance(type);
			}
			return Activator.CreateInstance(type, valuesForConstructorInjection);
		}

		private T Create<T>()
		{
			return (T)Create(typeof(T));
		}

		public T CreateAndInject<T>()
		{
			T val = Create<T>();
			Inject(val);
			return val;
		}

		public T GetValueForInjectionKey<T>()
		{
			object valueForInjectionKey = GetValueForInjectionKey(typeof(T));
			if (valueForInjectionKey is T)
			{
				return (T)valueForInjectionKey;
			}
			throw new InjectionException($"Cannot create instance of type {typeof(T)}. No binding found.");
		}

		public object GetValueForInjectionKey(object injectionKey)
		{
			object obj = GetProvider(injectionKey).Get(this, out var resultNeedsInjection);
			if (resultNeedsInjection)
			{
				Inject(obj, injectionKey);
			}
			return obj;
		}

		public void Inject(object target)
		{
			Inject(target, target.GetType());
		}

		private void Inject(object target, object injectionKey)
		{
			injectionKeyToObjectWithOngoingInjectionMap.Add(injectionKey, target);
			List<InjectionData> injectionDatas = UniInjectUtils.GetInjectionDatas(target.GetType());
			List<Exception> list = null;
			foreach (InjectionData item2 in injectionDatas)
			{
				try
				{
					Inject(target, item2);
				}
				catch (Exception e)
				{
					if (list == null)
					{
						list = new List<Exception>();
					}
					InjectionException item = new InjectionException("Cannot inject member '" + item2.MemberInfo.Name + "'", e);
					list.Add(item);
				}
			}
			injectionKeyToObjectWithOngoingInjectionMap.Remove(injectionKey);
			if (list != null)
			{
				throw new InjectionException($"Failed injection of object {target}" + $" of type {target.GetType()}:", list);
			}
			if (target is IInjectionFinishedListener)
			{
				(target as IInjectionFinishedListener).OnInjectionFinished();
			}
		}

		public void Inject(object target, InjectionData injectionData)
		{
			if (IsVisualElementQuery(injectionData, out var listGenericArgumentType))
			{
				InjectMemberFromUiDocument(target, injectionData.MemberInfo, injectionData.InjectionKeys[0] as string, injectionData.isOptional, listGenericArgumentType);
				return;
			}
			if (injectionData.searchMethod == SearchMethods.SearchInBindings)
			{
				InjectMemberFromBindings(target, injectionData.MemberInfo, injectionData.InjectionKeys, injectionData.isOptional);
				return;
			}
			if (target is MonoBehaviour)
			{
				InjectMemberFromUnitySearchMethod(target as MonoBehaviour, injectionData.MemberInfo, injectionData.searchMethod, injectionData.isOptional);
				return;
			}
			throw new InjectionException($"Cannot perform injection via {injectionData.searchMethod} into an object of type {target.GetType()}." + " Only MonoBehaviour instances are supported.");
		}

		private bool IsVisualElementQuery(InjectionData injectionData, out Type listGenericArgumentType)
		{
			listGenericArgumentType = null;
			if (injectionData.InjectionKeys.Length == 1 && injectionData.InjectionKeys[0] is string text && (text.StartsWith("#") || text.StartsWith(".")))
			{
				return IsTargetTypeVisualElement(injectionData, out listGenericArgumentType);
			}
			return false;
		}

		private static bool IsTargetTypeVisualElement(InjectionData injectionData, out Type listGenericArgumentType)
		{
			Type type;
			if (injectionData.MemberInfo is FieldInfo fieldInfo)
			{
				type = fieldInfo.FieldType;
			}
			else
			{
				if (!(injectionData.MemberInfo is PropertyInfo propertyInfo))
				{
					listGenericArgumentType = null;
					return false;
				}
				type = propertyInfo.PropertyType;
			}
			if (typeof(VisualElement).IsAssignableFrom(type))
			{
				listGenericArgumentType = null;
				return true;
			}
			if (ReflectionUtils.IsGenericListType(type))
			{
				listGenericArgumentType = type.GetGenericArguments()[0];
				return typeof(VisualElement).IsAssignableFrom(listGenericArgumentType);
			}
			listGenericArgumentType = null;
			return false;
		}

		private void InjectMemberFromUiDocument(object target, MemberInfo memberInfo, string injectionKeyString, bool isOptional, Type listGenericArgumentType)
		{
			string text = (injectionKeyString.StartsWith("#") ? injectionKeyString.Substring(1) : null);
			string text2 = (injectionKeyString.StartsWith(".") ? injectionKeyString.Substring(1) : null);
			TryGetValueToBeInjectedFromUiDocument(text, text2, listGenericArgumentType, out var valueToBeInjected);
			if (valueToBeInjected != null)
			{
				if (memberInfo is FieldInfo)
				{
					(memberInfo as FieldInfo).SetValue(target, valueToBeInjected);
					return;
				}
				if (!(memberInfo is PropertyInfo))
				{
					throw new InjectionException($"Only Fields and Properties are supported for injection of VisualElements but got member of type {memberInfo.MemberType}.");
				}
				(memberInfo as PropertyInfo).SetValue(target, valueToBeInjected);
			}
			else if (!isOptional)
			{
				throw new InjectionException("No VisualElement found using elementName: '" + text + "' and className: '" + text2 + "'");
			}
		}

		private bool TryGetRootVisualElement(out VisualElement rootVisualElement)
		{
			try
			{
				object valueForInjectionKey = GetValueForInjectionKey("rootVisualElement");
				if (valueForInjectionKey is VisualElement visualElement)
				{
					rootVisualElement = visualElement;
					return true;
				}
				if (valueForInjectionKey != null)
				{
					Debug.LogError("Object for injection key 'rootVisualElement' was found, but it is not of type VisualElement." + $" Instead, it is of type: {valueForInjectionKey.GetType()}");
				}
			}
			catch (MissingBindingException)
			{
			}
			if (TryGetUIDocument(out var uiDocument))
			{
				rootVisualElement = uiDocument.rootVisualElement;
				return true;
			}
			rootVisualElement = null;
			return false;
		}

		private bool TryGetValueToBeInjectedFromUiDocument(string elementName, string elementClassName, Type listGenericArgumentType, out object valueToBeInjected)
		{
			if (!TryGetRootVisualElement(out var rootVisualElement))
			{
				if (MaySearchInParentInjector())
				{
					return ParentInjector.TryGetValueToBeInjectedFromUiDocument(elementName, elementClassName, listGenericArgumentType, out valueToBeInjected);
				}
				valueToBeInjected = null;
				return false;
			}
			if (listGenericArgumentType != null)
			{
				valueToBeInjected = typeof(InjectorGenericMethodHolder).GetMethod("GetVisualElements").MakeGenericMethod(listGenericArgumentType).Invoke(this, new object[3] { rootVisualElement, elementName, elementClassName });
			}
			else
			{
				valueToBeInjected = rootVisualElement.Q(elementName, elementClassName);
			}
			if (valueToBeInjected == null)
			{
				if (MaySearchInParentInjector())
				{
					return ParentInjector.TryGetValueToBeInjectedFromUiDocument(elementName, elementClassName, listGenericArgumentType, out valueToBeInjected);
				}
				return false;
			}
			return true;
		}

		private bool MaySearchInParentInjector()
		{
			if (ParentInjector != null)
			{
				return SearchInParentInjector;
			}
			return false;
		}

		private bool TryGetUIDocument(out UIDocument uiDocument)
		{
			try
			{
				object valueForInjectionKey = GetValueForInjectionKey(typeof(UIDocument));
				if (valueForInjectionKey is UIDocument uIDocument)
				{
					uiDocument = uIDocument;
					return true;
				}
				if (valueForInjectionKey != null)
				{
					Debug.LogError("Object for injection key typeof(UIDocument) was found, but it is not of type UIDocument." + $" Instead, it is of type: {valueForInjectionKey.GetType()}");
				}
			}
			catch (MissingBindingException)
			{
			}
			uiDocument = null;
			return false;
		}

		private void InjectMemberFromBindings(object target, MemberInfo memberInfo, object[] injectionKeys, bool isOptional)
		{
			object[] valuesForInjectionKeys;
			if (isOptional)
			{
				try
				{
					valuesForInjectionKeys = GetValuesForInjectionKeys(injectionKeys, target, target.GetType());
				}
				catch (MissingBindingException)
				{
					return;
				}
			}
			else
			{
				valuesForInjectionKeys = GetValuesForInjectionKeys(injectionKeys, target, target.GetType());
			}
			if (valuesForInjectionKeys == null)
			{
				throw new InjectionException("No values to be injected.");
			}
			if (memberInfo is FieldInfo)
			{
				(memberInfo as FieldInfo).SetValue(target, valuesForInjectionKeys[0]);
				return;
			}
			if (memberInfo is PropertyInfo)
			{
				(memberInfo as PropertyInfo).SetValue(target, valuesForInjectionKeys[0]);
				return;
			}
			if (memberInfo is MethodInfo)
			{
				(memberInfo as MethodInfo).Invoke(target, valuesForInjectionKeys);
				return;
			}
			throw new InjectionException("Only Fields, Properties and Methods are supported for injection.");
		}

		private void InjectMemberFromUnitySearchMethod(MonoBehaviour script, MemberInfo memberInfo, SearchMethods searchMethod, bool isOptional)
		{
			Type typeOfFieldOrProperty = ReflectionUtils.GetTypeOfFieldOrProperty(script, memberInfo);
			object obj = GetComponentFromUnitySearchMethodMockups(script, searchMethod, typeOfFieldOrProperty);
			if (obj == null)
			{
				obj = UniInjectUtils.InvokeUnitySearchMethod(script, searchMethod, typeOfFieldOrProperty);
			}
			if (obj != null)
			{
				if (memberInfo is FieldInfo)
				{
					(memberInfo as FieldInfo).SetValue(script, obj);
					return;
				}
				if (!(memberInfo is PropertyInfo))
				{
					throw new InjectionException($"Cannot inject member '{memberInfo}' of {script.name}." + " Only Fields and Properties are supported for component injection via Unity methods.");
				}
				(memberInfo as PropertyInfo).SetValue(script, obj);
			}
			else if (!isOptional)
			{
				throw new InjectionException("Cannot inject member '" + memberInfo.Name + "' of " + script.name + "." + $" No component of type {typeOfFieldOrProperty} found using method {searchMethod}");
			}
		}

		private object GetComponentFromUnitySearchMethodMockups(MonoBehaviour script, SearchMethods searchMethod, Type componentType)
		{
			foreach (UnitySearchMethodMockup unitySearchMethodMockup in unitySearchMethodMockups)
			{
				Type type = unitySearchMethodMockup.searchResult.GetType();
				bool num = unitySearchMethodMockup.callingScript == null || unitySearchMethodMockup.callingScript == script;
				bool flag = unitySearchMethodMockup.searchMethod == searchMethod;
				bool flag2 = componentType.IsAssignableFrom(type);
				if (num & flag & flag2)
				{
					return unitySearchMethodMockup.searchResult;
				}
			}
			return null;
		}

		internal object[] GetValuesForConstructorInjection(Type type)
		{
			if (getValuesForConstructorInjectionVisitedTypes.Contains(type))
			{
				throw new CyclicConstructorDependenciesException($"Circular dependencies in the constructor parameters of type {type}");
			}
			getValuesForConstructorInjectionVisitedTypes.Add(type);
			object[] injectionKeys = UniInjectUtils.GetConstructorInjectionData(type).InjectionKeys;
			object[] valuesForInjectionKeys = GetValuesForInjectionKeys(injectionKeys, null, type);
			getValuesForConstructorInjectionVisitedTypes.Remove(type);
			return valuesForInjectionKeys;
		}

		private object[] GetValuesForInjectionKeys(object[] injectionKeys, object target, Type targetType)
		{
			if (injectionKeys == null)
			{
				return null;
			}
			object[] array = new object[injectionKeys.Length];
			int num = 0;
			foreach (object obj in injectionKeys)
			{
				if (!injectionKeyToObjectWithOngoingInjectionMap.TryGetValue(obj, out var value))
				{
					value = GetValueForInjectionKey(obj);
				}
				if (value == null)
				{
					if (target != null)
					{
						throw new MissingBindingException(value, obj, target);
					}
					throw new MissingBindingException(value, obj, targetType);
				}
				array[num] = value;
				num++;
			}
			return array;
		}

		private IProvider GetProvider(object injectionKey)
		{
			injectionKeyToProviderMap.TryGetValue(injectionKey, out var value);
			if (value == null && injectionKey is Type c && typeof(Injector).IsAssignableFrom(c))
			{
				if (thisInstanceProvider == null)
				{
					thisInstanceProvider = new ExistingInstanceProvider<Injector>(this);
				}
				return thisInstanceProvider;
			}
			if (value == null && MaySearchInParentInjector())
			{
				value = ParentInjector.GetProvider(injectionKey);
			}
			if (value == null)
			{
				throw new MissingBindingException(injectionKey);
			}
			return value;
		}

		public void AddBinding(IBinding binding, RebindingBehavior rebindingBehavior = RebindingBehavior.LogWarning)
		{
			object key = binding.GetKey();
			if (rebindingBehavior != RebindingBehavior.Ignore && injectionKeyToProviderMap.ContainsKey(key))
			{
				switch (rebindingBehavior)
				{
				case RebindingBehavior.LogWarning:
					Debug.LogWarning($"Re-binding of key {key}");
					break;
				case RebindingBehavior.LogError:
					Debug.LogError($"Re-binding of key {key}");
					break;
				case RebindingBehavior.Throw:
					throw new RebindingException(key);
				}
			}
			injectionKeyToProviderMap[key] = binding.GetProvider();
		}

		public void ClearBindings()
		{
			injectionKeyToProviderMap.Clear();
		}

		public void MockUnitySearchMethod(MonoBehaviour callingScript, SearchMethods searchMethod, object searchResult)
		{
			UnitySearchMethodMockup item = new UnitySearchMethodMockup(callingScript, searchMethod, searchResult);
			unitySearchMethodMockups.Add(item);
		}
	}
}
