using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Text.RegularExpressions;

namespace Serilog.Settings.KeyValuePairs
{
	internal class SettingValueConversions
	{
		private static Regex StaticMemberAccessorRegex = new Regex("^(?<shortTypeName>[^:]+)::(?<memberName>[A-Za-z][A-Za-z0-9]*)(?<typeNameExtraQualifiers>[^:]*)$");

		private static Dictionary<Type, Func<string, object>> ExtendedTypeConversions = new Dictionary<Type, Func<string, object>>
		{
			{
				typeof(Uri),
				(string s) => new Uri(s)
			},
			{
				typeof(TimeSpan),
				(string s) => TimeSpan.Parse(s)
			},
			{
				typeof(Type),
				(string s) => Type.GetType(s, throwOnError: true)
			}
		};

		public static object ConvertToType(string value, Type toType)
		{
			TypeInfo toTypeInfo = toType.GetTypeInfo();
			if (toTypeInfo.IsGenericType && toType.GetGenericTypeDefinition() == typeof(Nullable<>))
			{
				if (string.IsNullOrEmpty(value))
				{
					return null;
				}
				toType = toTypeInfo.GenericTypeArguments[0];
				toTypeInfo = toType.GetTypeInfo();
			}
			if (toTypeInfo.IsEnum)
			{
				return Enum.Parse(toType, value);
			}
			Func<string, object> func = (from t in ExtendedTypeConversions
				where t.Key.GetTypeInfo().IsAssignableFrom(toTypeInfo)
				select t.Value).FirstOrDefault();
			if (func != null)
			{
				return func(value);
			}
			if ((toTypeInfo.IsInterface || toTypeInfo.IsAbstract) && !string.IsNullOrWhiteSpace(value))
			{
				if (TryParseStaticMemberAccessor(value, out var accessorTypeName, out var memberName))
				{
					Type type = Type.GetType(accessorTypeName, throwOnError: true);
					PropertyInfo propertyInfo = (from x in type.GetTypeInfo().DeclaredProperties
						where x.Name == memberName
						where x.GetMethod != null
						where x.GetMethod.IsPublic
						select x).FirstOrDefault((PropertyInfo x) => x.GetMethod.IsStatic);
					if (propertyInfo != null)
					{
						return propertyInfo.GetValue(null);
					}
					FieldInfo fieldInfo = (from x in type.GetTypeInfo().DeclaredFields
						where x.Name == memberName
						where x.IsPublic
						select x).FirstOrDefault((FieldInfo x) => x.IsStatic);
					if (fieldInfo != null)
					{
						return fieldInfo.GetValue(null);
					}
					throw new InvalidOperationException("Could not find a public static property or field with name `" + memberName + "` on type `" + accessorTypeName + "`");
				}
				Type type2 = Type.GetType(value.Trim(), throwOnError: false);
				if (type2 != null)
				{
					ConstructorInfo constructorInfo = type2.GetTypeInfo().DeclaredConstructors.FirstOrDefault((ConstructorInfo ci) =>
					{
						ParameterInfo[] parameters2 = ci.GetParameters();
						return parameters2.Length == 0 || parameters2.All((ParameterInfo pi) => pi.HasDefaultValue);
					});
					if (constructorInfo == null)
					{
						throw new InvalidOperationException("A default constructor was not found on " + type2.FullName + ".");
					}
					object[] parameters = (from pi in constructorInfo.GetParameters()
						select pi.DefaultValue).ToArray();
					return constructorInfo.Invoke(parameters);
				}
			}
			return Convert.ChangeType(value, toType);
		}

		internal static bool TryParseStaticMemberAccessor(string input, out string accessorTypeName, out string memberName)
		{
			if (input == null)
			{
				accessorTypeName = null;
				memberName = null;
				return false;
			}
			if (StaticMemberAccessorRegex.IsMatch(input))
			{
				Match match = StaticMemberAccessorRegex.Match(input);
				string value = match.Groups["shortTypeName"].Value;
				string value2 = match.Groups["memberName"].Value;
				string value3 = match.Groups["typeNameExtraQualifiers"].Value;
				memberName = value2.Trim();
				accessorTypeName = value.Trim() + value3.TrimEnd();
				return true;
			}
			accessorTypeName = null;
			memberName = null;
			return false;
		}
	}
}
