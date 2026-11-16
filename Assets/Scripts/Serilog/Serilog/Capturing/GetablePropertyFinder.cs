using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;

namespace Serilog.Capturing
{
	internal static class GetablePropertyFinder
	{
		internal static IEnumerable<PropertyInfo> GetPropertiesRecursive(this Type type)
		{
			HashSet<string> seenNames = new HashSet<string>();
			TypeInfo currentTypeInfo = type.GetTypeInfo();
			while (currentTypeInfo.AsType() != typeof(object))
			{
				IEnumerable<PropertyInfo> enumerable = currentTypeInfo.DeclaredProperties.Where((PropertyInfo p) => p.CanRead && p.GetMethod.IsPublic && !p.GetMethod.IsStatic && (p.Name != "Item" || p.GetIndexParameters().Length == 0) && !seenNames.Contains(p.Name));
				foreach (PropertyInfo item in enumerable)
				{
					seenNames.Add(item.Name);
					yield return item;
				}
				Type baseType = currentTypeInfo.BaseType;
				if (!(baseType == null))
				{
					currentTypeInfo = baseType.GetTypeInfo();
					continue;
				}
				break;
			}
		}
	}
}
