using System;
using System.Collections.Generic;
using FullSerializer;
using UnityEngine;

public class Color32Converter : fsConverter
{
	public override bool CanProcess(Type type)
	{
		return type == typeof(Color32);
	}

	public override fsResult TrySerialize(object instance, out fsData serialized, Type storageType)
	{
		if (!(instance is Color32 color))
		{
			throw new InvalidOperationException("FullSerializer Internal Error -- Unexpected serialization type");
		}
		serialized = new fsData("#" + Colors.ToHexColor(color));
		return fsResult.Success;
	}

	public override fsResult TryDeserialize(fsData data, ref object instance, Type storageType)
	{
		if (storageType != typeof(Color32))
		{
			throw new InvalidOperationException("FullSerializer Internal Error -- Unexpected deserialization type");
		}
		if (!data.IsString)
		{
			return ParseColor32FromDataAsDictionary(data, ref instance);
		}
		return ParseColor32FromDataAsString(data, ref instance);
	}

	private fsResult ParseColor32FromDataAsString(fsData data, ref object instance)
	{
		if (Colors.TryParseHexColor(data.AsString, out var color))
		{
			instance = color;
			return fsResult.Success;
		}
		return fsResult.Fail($"Unable to parse {data} into a Color32");
	}

	private fsResult ParseColor32FromDataAsDictionary(fsData data, ref object instance)
	{
		Dictionary<string, fsData> dataAsDictionary = data.AsDictionary;
		try
		{
			byte r = GetColorFromDataAsDictionary("r", byte.MaxValue);
			byte g = GetColorFromDataAsDictionary("g", byte.MaxValue);
			byte b = GetColorFromDataAsDictionary("b", byte.MaxValue);
			byte a = GetColorFromDataAsDictionary("a", byte.MaxValue);
			instance = new Color32(r, g, b, a);
			return fsResult.Success;
		}
		catch (Exception message)
		{
			Debug.LogError(message);
			instance = Colors.white;
			return fsResult.Fail($"Unable to parse {data} into a Color32");
		}
		byte GetColorFromDataAsDictionary(string key, byte fallbackValue)
		{
			if (dataAsDictionary.TryGetValue(key, out var value))
			{
				return (byte)value.AsInt64;
			}
			return fallbackValue;
		}
	}
}
