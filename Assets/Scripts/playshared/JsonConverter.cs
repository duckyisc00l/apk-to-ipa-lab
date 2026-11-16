using System;
using System.Linq;
using FullSerializer;

public static class JsonConverter
{
	private const string IndentString = "    ";

	private static fsSerializer CreateSerializer()
	{
		fsSerializer obj = new fsSerializer();
		obj.AddConverter(new Color32Converter());
		return obj;
	}

	public static string ToJson<T>(T obj, bool prettyPrint = false)
	{
		CreateSerializer().TrySerialize(typeof(T), obj, out var data).AssertSuccessWithoutWarnings();
		string text = fsJsonPrinter.CompressedJson(data);
		if (prettyPrint)
		{
			text = FormatJson(text);
		}
		return text;
	}

	public static T FromJson<T>(string json) where T : new()
	{
		fsData data = fsJsonParser.Parse(json);
		T instance = new T();
		CreateSerializer().TryDeserialize(data, ref instance).AssertSuccessWithoutWarnings();
		return instance;
	}

	public static void FillFromJson<T>(string json, T existingInstance)
	{
		fsData data = fsJsonParser.Parse(json);
		CreateSerializer().TryDeserialize(data, ref existingInstance).AssertSuccessWithoutWarnings();
	}

	private static string FormatJson(string json)
	{
		int indentation = 0;
		int quoteCount = 0;
		return string.Concat((from ch in json
			let quotes = (ch == '"') ? quoteCount++ : quoteCount
			let lineBreak = (ch == ',' && quotes % 2 == 0) ? string.Concat(ch.ToString(), Environment.NewLine, string.Concat(Enumerable.Repeat("    ", indentation))) : null
			let openChar = (ch == '{' || ch == '[') ? string.Concat(ch.ToString(), Environment.NewLine, string.Concat(Enumerable.Repeat("    ", ++indentation))) : ch.ToString()
			select new
			{
				_003C_003Eh__TransparentIdentifier2 = _003C_003Eh__TransparentIdentifier2,
				closeChar = ((ch == '}' || ch == ']') ? string.Concat(Environment.NewLine, string.Concat(Enumerable.Repeat("    ", --indentation)), ch.ToString()) : ch.ToString())
			}).Select(_003C_003Eh__TransparentIdentifier3 =>
		{
			if (_003C_003Eh__TransparentIdentifier3._003C_003Eh__TransparentIdentifier2._003C_003Eh__TransparentIdentifier1.lineBreak != null)
			{
				return _003C_003Eh__TransparentIdentifier3._003C_003Eh__TransparentIdentifier2._003C_003Eh__TransparentIdentifier1.lineBreak;
			}
			return (_003C_003Eh__TransparentIdentifier3._003C_003Eh__TransparentIdentifier2.openChar.Length <= 1) ? _003C_003Eh__TransparentIdentifier3.closeChar : _003C_003Eh__TransparentIdentifier3._003C_003Eh__TransparentIdentifier2.openChar;
		}));
	}
}
