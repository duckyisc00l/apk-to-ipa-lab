using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Runtime.CompilerServices;
using Serilog.Configuration;

namespace Serilog.Settings.KeyValuePairs
{
	internal static class CallableConfigurationMethodFinder
	{
		internal static IList<MethodInfo> FindConfigurationMethods(IEnumerable<Assembly> configurationAssemblies, Type configType)
		{
			List<MethodInfo> list = (from m in configurationAssemblies.SelectMany((Assembly a) => from t in a.ExportedTypes
					select t.GetTypeInfo() into t
					where t.IsSealed && t.IsAbstract && !t.IsNested
					select t).SelectMany((TypeInfo t) => t.DeclaredMethods)
				where m.IsStatic && m.IsPublic && m.IsDefined(typeof(ExtensionAttribute), inherit: false)
				where m.GetParameters()[0].ParameterType == configType
				select m).ToList();
			if (configType == typeof(LoggerSinkConfiguration))
			{
				list.AddRange(SurrogateConfigurationMethods.WriteTo);
			}
			if (configType == typeof(LoggerAuditSinkConfiguration))
			{
				list.AddRange(SurrogateConfigurationMethods.AuditTo);
			}
			if (configType == typeof(LoggerEnrichmentConfiguration))
			{
				list.AddRange(SurrogateConfigurationMethods.Enrich);
			}
			if (configType == typeof(LoggerDestructuringConfiguration))
			{
				list.AddRange(SurrogateConfigurationMethods.Destructure);
			}
			if (configType == typeof(LoggerFilterConfiguration))
			{
				list.AddRange(SurrogateConfigurationMethods.Filter);
			}
			return list;
		}
	}
}
