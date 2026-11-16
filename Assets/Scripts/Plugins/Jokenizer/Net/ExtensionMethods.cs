using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Reflection;
using System.Runtime.CompilerServices;

namespace Jokenizer.Net
{
	public static class ExtensionMethods
	{
		private static HashSet<MethodInfo> extensions;

		static ExtensionMethods()
		{
			extensions = new HashSet<MethodInfo>();
			ScanTypes(typeof(Queryable), typeof(Enumerable));
		}

		public static IList<MethodInfo> ProbeAllAssemblies()
		{
			return ProbeAssemblies(Assembly.GetEntryAssembly().GetReferencedAssemblies().Select(Assembly.Load));
		}

		public static IList<MethodInfo> ProbeAssemblies(params Assembly[] assemblies)
		{
			return assemblies.SelectMany(ProbeAssembly).ToList();
		}

		public static IList<MethodInfo> ProbeAssemblies(IEnumerable<Assembly> assemblies)
		{
			return assemblies.SelectMany(ProbeAssembly).ToList();
		}

		public static IList<MethodInfo> ProbeAssembly(Assembly assembly)
		{
			return ScanTypes(from t in assembly.GetTypes()
				where t.IsSealed && !t.IsGenericType && !t.IsNested
				select t);
		}

		public static IList<MethodInfo> ScanTypes(params Type[] types)
		{
			return types.SelectMany(ScanType).ToList();
		}

		public static IList<MethodInfo> ScanTypes(IEnumerable<Type> types)
		{
			return types.SelectMany(ScanType).ToList();
		}

		public static IList<MethodInfo> ScanType(Type type)
		{
			List<MethodInfo> list = (from m in type.GetMethods(BindingFlags.Static | BindingFlags.Public | BindingFlags.NonPublic)
				where m.IsDefined(typeof(ExtensionAttribute), inherit: false)
				select m).ToList();
			list.ForEach((MethodInfo m) =>
			{
				extensions.Add(m);
			});
			return list;
		}

		public static MethodInfo Find(Type forType, string name, Expression[] availableArgs)
		{
			Type[] array = (forType.IsConstructedGenericType ? forType.GetGenericArguments() : new Type[0]);
			foreach (MethodInfo extension in extensions)
			{
				MethodInfo methodInfo = extension;
				if (methodInfo.Name != name)
				{
					continue;
				}
				if (methodInfo.IsGenericMethodDefinition)
				{
					if (methodInfo.GetGenericArguments().Length != array.Length)
					{
						continue;
					}
					methodInfo = methodInfo.MakeGenericMethod(array);
				}
				ParameterInfo[] parameters = methodInfo.GetParameters();
				if (parameters[0].ParameterType.IsAssignableFrom(forType) && Helper.IsSuitable(parameters.Skip(1).ToArray(), availableArgs))
				{
					return methodInfo;
				}
			}
			return null;
		}
	}
}
