using System;
using System.Collections.Generic;
using System.Reflection;

namespace UniInject
{
	internal static class ReflectionUtils
	{
		internal static List<InjectionData> CreateInjectionDatas(Type type)
		{
			List<InjectionData> list = new List<InjectionData>();
			MemberInfo[] members = type.GetMembers(BindingFlags.Instance | BindingFlags.Public | BindingFlags.NonPublic);
			foreach (MemberInfo memberInfo in members)
			{
				InjectionData injectionData = CreateInjectionData(type, memberInfo);
				if (injectionData != null)
				{
					list.Add(injectionData);
				}
			}
			return list;
		}

		private static InjectionData CreateInjectionData(Type type, MemberInfo memberInfo)
		{
			InjectAttribute customAttribute = memberInfo.GetCustomAttribute<InjectAttribute>();
			InjectionData result = null;
			if (customAttribute != null)
			{
				if (memberInfo is FieldInfo || memberInfo is PropertyInfo)
				{
					result = CreateInjectionDataForFieldOrProperty(type, memberInfo, customAttribute);
				}
				else if (memberInfo is MethodInfo)
				{
					result = CreateInjectionDataForMethod(type, memberInfo as MethodInfo, customAttribute);
				}
			}
			return result;
		}

		private static InjectionData CreateInjectionDataForFieldOrProperty(Type type, MemberInfo memberInfo, InjectAttribute injectAttribute)
		{
			object obj = injectAttribute.Key;
			if (obj == null)
			{
				obj = GetTypeOfFieldOrProperty(type, memberInfo);
			}
			object[] injectionKeys = new object[1] { obj };
			return new InjectionData(type, memberInfo, injectionKeys, injectAttribute.SearchMethod, injectAttribute.Optional);
		}

		private static InjectionData CreateInjectionDataForMethod(Type type, MethodInfo methodInfo, InjectAttribute injectAttribute)
		{
			ParameterInfo[] parameters = methodInfo.GetParameters();
			object[] array = new object[parameters.Length];
			ParameterInfo[] array2 = parameters;
			foreach (ParameterInfo obj in array2)
			{
				object injectionKey = GetInjectionKey(obj);
				int position = obj.Position;
				array[position] = injectionKey;
			}
			return new InjectionData(type, methodInfo, array, injectAttribute.SearchMethod, injectAttribute.Optional);
		}

		internal static ConstructorInjectionData CreateConstructorInjectionData(Type type)
		{
			ConstructorInfo[] constructors = type.GetConstructors(BindingFlags.Instance | BindingFlags.Public);
			if (constructors.Length == 0)
			{
				return new ConstructorInjectionData(type, null);
			}
			if (constructors.Length == 1)
			{
				return CreateConstructorInjectionData(type, constructors[0]);
			}
			ConstructorInfo constructorInfo = null;
			ConstructorInfo[] array = constructors;
			foreach (ConstructorInfo constructorInfo2 in array)
			{
				if (constructorInfo2.GetCustomAttribute<InjectAttribute>() != null)
				{
					if (!(constructorInfo == null))
					{
						throw new InjectionException($"There should only be one public constructor annotated with Inject, but found multiple for type {type}");
					}
					constructorInfo = constructorInfo2;
				}
			}
			if (constructorInfo != null)
			{
				return CreateConstructorInjectionData(type, constructorInfo);
			}
			throw new InjectionException($"Multiple public constructors found for type {type}." + " It is unclear how to instantiate objects of the type. Add an Inject annotation to the constructor that should be used.");
		}

		private static ConstructorInjectionData CreateConstructorInjectionData(Type type, ConstructorInfo constructorInfo)
		{
			ParameterInfo[] parameters = constructorInfo.GetParameters();
			object[] array = new object[parameters.Length];
			ParameterInfo[] array2 = parameters;
			foreach (ParameterInfo obj in array2)
			{
				object injectionKey = GetInjectionKey(obj);
				int position = obj.Position;
				array[position] = injectionKey;
			}
			return new ConstructorInjectionData(type, array);
		}

		private static object GetInjectionKey(ParameterInfo parameterInfo)
		{
			InjectionKeyAttribute customAttribute = parameterInfo.GetCustomAttribute<InjectionKeyAttribute>();
			if (customAttribute != null)
			{
				return customAttribute.Key;
			}
			return parameterInfo.ParameterType;
		}

		internal static Type GetTypeOfFieldOrProperty(object obj, MemberInfo memberInfo)
		{
			if (memberInfo is FieldInfo)
			{
				return (memberInfo as FieldInfo).FieldType;
			}
			if (memberInfo is PropertyInfo)
			{
				return (memberInfo as PropertyInfo).PropertyType;
			}
			throw new ArgumentException($"Member is neither a field nor a property: {obj.GetType()}.{memberInfo.Name}");
		}

		public static bool IsGenericListType(Type type)
		{
			if (type.IsGenericType)
			{
				return type.GetGenericTypeDefinition() == typeof(List<>);
			}
			return false;
		}
	}
}
