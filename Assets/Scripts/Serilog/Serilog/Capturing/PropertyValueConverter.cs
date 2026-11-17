using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Runtime.CompilerServices;
using Serilog.Core;
using Serilog.Debugging;
using Serilog.Events;
using Serilog.Parsing;
using Serilog.Policies;

namespace Serilog.Capturing
{
	internal class PropertyValueConverter : ILogEventPropertyFactory, ILogEventPropertyValueFactory
	{
		private class DepthLimiter : ILogEventPropertyValueFactory
		{
			[ThreadStatic]
			private static int _currentDepth;

			private readonly int _maximumDestructuringDepth;

			private readonly PropertyValueConverter _propertyValueConverter;

			public DepthLimiter(int maximumDepth, PropertyValueConverter propertyValueConverter)
			{
				_maximumDestructuringDepth = maximumDepth;
				_propertyValueConverter = propertyValueConverter;
			}

			public static void SetCurrentDepth(int depth)
			{
				_currentDepth = depth;
			}

			public LogEventPropertyValue CreatePropertyValue(object value, Destructuring destructuring)
			{
				int currentDepth = _currentDepth;
				LogEventPropertyValue result = DefaultIfMaximumDepth(currentDepth) ?? _propertyValueConverter.CreatePropertyValue(value, destructuring, currentDepth + 1);
				_currentDepth = currentDepth;
				return result;
			}

			LogEventPropertyValue ILogEventPropertyValueFactory.CreatePropertyValue(object value, bool destructureObjects)
			{
				int currentDepth = _currentDepth;
				LogEventPropertyValue result = DefaultIfMaximumDepth(currentDepth) ?? _propertyValueConverter.CreatePropertyValue(value, destructureObjects, currentDepth + 1);
				_currentDepth = currentDepth;
				return result;
			}

			private LogEventPropertyValue DefaultIfMaximumDepth(int depth)
			{
				if (depth == _maximumDestructuringDepth)
				{
					SelfLog.WriteLine("Maximum destructuring depth reached.");
					return new ScalarValue(null);
				}
				return null;
			}
		}

		private static readonly HashSet<Type> BuiltInScalarTypes = new HashSet<Type>
		{
			typeof(bool),
			typeof(char),
			typeof(byte),
			typeof(short),
			typeof(ushort),
			typeof(int),
			typeof(uint),
			typeof(long),
			typeof(ulong),
			typeof(float),
			typeof(double),
			typeof(decimal),
			typeof(string),
			typeof(DateTime),
			typeof(DateTimeOffset),
			typeof(TimeSpan),
			typeof(Guid),
			typeof(Uri)
		};

		private readonly IDestructuringPolicy[] _destructuringPolicies;

		private readonly IScalarConversionPolicy[] _scalarConversionPolicies;

		private readonly DepthLimiter _depthLimiter;

		private readonly int _maximumStringLength;

		private readonly int _maximumCollectionCount;

		private readonly bool _propagateExceptions;

		public PropertyValueConverter(int maximumDestructuringDepth, int maximumStringLength, int maximumCollectionCount, IEnumerable<Type> additionalScalarTypes, IEnumerable<IDestructuringPolicy> additionalDestructuringPolicies, bool propagateExceptions)
		{
			if (additionalScalarTypes == null)
			{
				throw new ArgumentNullException("additionalScalarTypes");
			}
			if (additionalDestructuringPolicies == null)
			{
				throw new ArgumentNullException("additionalDestructuringPolicies");
			}
			if (maximumDestructuringDepth < 0)
			{
				throw new ArgumentOutOfRangeException("maximumDestructuringDepth");
			}
			if (maximumStringLength < 2)
			{
				throw new ArgumentOutOfRangeException("maximumStringLength");
			}
			if (maximumCollectionCount < 1)
			{
				throw new ArgumentOutOfRangeException("maximumCollectionCount");
			}
			_propagateExceptions = propagateExceptions;
			_maximumStringLength = maximumStringLength;
			_maximumCollectionCount = maximumCollectionCount;
			_scalarConversionPolicies = new IScalarConversionPolicy[3]
			{
				new SimpleScalarConversionPolicy(BuiltInScalarTypes.Concat(additionalScalarTypes)),
				new EnumScalarConversionPolicy(),
				new ByteArrayScalarConversionPolicy()
			};
			_destructuringPolicies = additionalDestructuringPolicies.Concat(new IDestructuringPolicy[2]
			{
				new DelegateDestructuringPolicy(),
				new ReflectionTypesScalarDestructuringPolicy()
			}).ToArray();
			_depthLimiter = new DepthLimiter(maximumDestructuringDepth, this);
		}

		public LogEventProperty CreateProperty(string name, object value, bool destructureObjects = false)
		{
			return new LogEventProperty(name, CreatePropertyValue(value, destructureObjects));
		}

		public LogEventPropertyValue CreatePropertyValue(object value, bool destructureObjects = false)
		{
			return CreatePropertyValue(value, destructureObjects, 1);
		}

		public LogEventPropertyValue CreatePropertyValue(object value, Destructuring destructuring)
		{
			try
			{
				return CreatePropertyValue(value, destructuring, 1);
			}
			catch (Exception ex)
			{
				SelfLog.WriteLine("Exception caught while converting property value: {0}", ex);
				if (_propagateExceptions)
				{
					throw;
				}
				return new ScalarValue("Capturing the property value threw an exception: " + ex.GetType().Name);
			}
		}

		private LogEventPropertyValue CreatePropertyValue(object value, bool destructureObjects, int depth)
		{
			return CreatePropertyValue(value, destructureObjects ? Destructuring.Destructure : Destructuring.Default, depth);
		}

		private LogEventPropertyValue CreatePropertyValue(object value, Destructuring destructuring, int depth)
		{
			if (value == null)
			{
				return new ScalarValue(null);
			}
			switch (destructuring)
			{
			case Destructuring.Stringify:
				return Stringify(value);
			case Destructuring.Destructure:
				if (value is string text)
				{
					value = TruncateIfNecessary(text);
				}
				break;
			}
			if (value is string)
			{
				return new ScalarValue(value);
			}
			IScalarConversionPolicy[] scalarConversionPolicies = _scalarConversionPolicies;
			for (int i = 0; i < scalarConversionPolicies.Length; i++)
			{
				if (scalarConversionPolicies[i].TryConvertToScalar(value, out var result))
				{
					return result;
				}
			}
			DepthLimiter.SetCurrentDepth(depth);
			if (destructuring == Destructuring.Destructure)
			{
				IDestructuringPolicy[] destructuringPolicies = _destructuringPolicies;
				for (int i = 0; i < destructuringPolicies.Length; i++)
				{
					if (destructuringPolicies[i].TryDestructure(value, _depthLimiter, out var result2))
					{
						return result2;
					}
				}
			}
			Type type = value.GetType();
			if (TryConvertEnumerable(value, destructuring, type, out var result3))
			{
				return result3;
			}
			if (TryConvertValueTuple(value, destructuring, type, out var result4))
			{
				return result4;
			}
			if (TryConvertCompilerGeneratedType(value, destructuring, type, out var result5))
			{
				return result5;
			}
			return new ScalarValue(value.ToString());
		}

		private bool TryConvertEnumerable(object value, Destructuring destructuring, Type valueType, out LogEventPropertyValue result)
		{
			if (value is IEnumerable sequence)
			{
				if (TryGetDictionary(value, valueType, out var dictionary))
				{
					result = new DictionaryValue(MapToDictionaryElements(dictionary, destructuring));
					return true;
				}
				result = new SequenceValue(MapToSequenceElements(sequence, destructuring));
				return true;
			}
			result = null;
			return false;
			IEnumerable<KeyValuePair<ScalarValue, LogEventPropertyValue>> MapToDictionaryElements(IDictionary dictionaryEntries, Destructuring destructure)
			{
				int count = 0;
				foreach (DictionaryEntry dictionaryEntry in dictionaryEntries)
				{
					int num = count + 1;
					count = num;
					if (num > _maximumCollectionCount)
					{
						yield break;
					}
					KeyValuePair<ScalarValue, LogEventPropertyValue> keyValuePair = new KeyValuePair<ScalarValue, LogEventPropertyValue>((ScalarValue)_depthLimiter.CreatePropertyValue(dictionaryEntry.Key, destructure), _depthLimiter.CreatePropertyValue(dictionaryEntry.Value, destructure));
					if (keyValuePair.Key.Value != null)
					{
						yield return keyValuePair;
					}
				}
			}
			IEnumerable<LogEventPropertyValue> MapToSequenceElements(IEnumerable enumerable, Destructuring destructure)
			{
				int count = 0;
				foreach (object item in enumerable)
				{
					int num = count + 1;
					count = num;
					if (num > _maximumCollectionCount)
					{
						yield break;
					}
					yield return _depthLimiter.CreatePropertyValue(item, destructure);
				}
			}
		}

		private bool TryConvertValueTuple(object value, Destructuring destructuring, Type valueType, out LogEventPropertyValue result)
		{
			if (!(value is IStructuralEquatable) || !valueType.IsConstructedGenericType)
			{
				result = null;
				return false;
			}
			switch (valueType.GetGenericTypeDefinition().FullName)
			{
			case "System.ValueTuple`1":
			case "System.ValueTuple`2":
			case "System.ValueTuple`3":
			case "System.ValueTuple`4":
			case "System.ValueTuple`5":
			case "System.ValueTuple`6":
			case "System.ValueTuple`7":
			{
				List<LogEventPropertyValue> list = new List<LogEventPropertyValue>();
				foreach (FieldInfo declaredField in valueType.GetTypeInfo().DeclaredFields)
				{
					if (declaredField.IsPublic && !declaredField.IsStatic)
					{
						object value2 = declaredField.GetValue(value);
						LogEventPropertyValue item = _depthLimiter.CreatePropertyValue(value2, destructuring);
						list.Add(item);
					}
				}
				result = new SequenceValue(list);
				return true;
			}
			default:
				result = null;
				return false;
			}
		}

		private bool TryConvertCompilerGeneratedType(object value, Destructuring destructuring, Type valueType, out LogEventPropertyValue result)
		{
			if (destructuring == Destructuring.Destructure)
			{
				string text = valueType.Name;
				if (text.Length <= 0 || IsCompilerGeneratedType(valueType))
				{
					text = null;
				}
				result = new StructureValue(GetProperties(value), text);
				return true;
			}
			result = null;
			return false;
		}

		private LogEventPropertyValue Stringify(object value)
		{
			string text = value.ToString();
			return new ScalarValue(TruncateIfNecessary(text));
		}

		private string TruncateIfNecessary(string text)
		{
			if (text.Length > _maximumStringLength)
			{
				return text.Substring(0, _maximumStringLength - 1) + "…";
			}
			return text;
		}

		private static bool TryGetDictionary(object value, Type valueType, out IDictionary dictionary)
		{
			if (valueType.IsConstructedGenericType && valueType.GetGenericTypeDefinition() == typeof(Dictionary<, >) && IsValidDictionaryKeyType(valueType.GenericTypeArguments[0]))
			{
				dictionary = (IDictionary)value;
				return true;
			}
			dictionary = null;
			return false;
		}

		private static bool IsValidDictionaryKeyType(Type valueType)
		{
			if (!BuiltInScalarTypes.Contains(valueType))
			{
				return valueType.GetTypeInfo().IsEnum;
			}
			return true;
		}

		private IEnumerable<LogEventProperty> GetProperties(object value)
		{
			foreach (PropertyInfo item in value.GetType().GetPropertiesRecursive())
			{
				object value2;
				try
				{
					value2 = item.GetValue(value);
				}
				catch (TargetParameterCountException)
				{
					SelfLog.WriteLine("The property accessor {0} is a non-default indexer", item);
					continue;
				}
				catch (TargetInvocationException ex2)
				{
					SelfLog.WriteLine("The property accessor {0} threw exception: {1}", item, ex2);
					if (_propagateExceptions)
					{
						throw;
					}
					value2 = "The property accessor threw an exception: " + ex2.InnerException?.GetType().Name;
				}
				yield return new LogEventProperty(item.Name, _depthLimiter.CreatePropertyValue(value2, Destructuring.Destructure));
			}
		}

		[MethodImpl(MethodImplOptions.AggressiveInlining)]
		internal static bool IsCompilerGeneratedType(Type type)
		{
			TypeInfo typeInfo = type.GetTypeInfo();
			string name = type.Name;
			if (typeInfo.IsGenericType && typeInfo.IsSealed && typeInfo.IsNotPublic && type.Namespace == null)
			{
				if (name[0] != '<')
				{
					if (name.Length > 2 && name[0] == 'V' && name[1] == 'B')
					{
						return name[2] == '$';
					}
					return false;
				}
				return true;
			}
			return false;
		}
	}
}
