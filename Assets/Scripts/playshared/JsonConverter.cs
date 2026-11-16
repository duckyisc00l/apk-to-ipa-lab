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
		// Rewritten by hand: the decompiler could not rebuild the original LINQ query (it used 'let').
		// Same steps, same order, for each character.
		int indentation = 0;
		int quoteCount = 0;
		var sb = new System.Text.StringBuilder();
		foreach (char ch in json)
		{
			int quotes = (ch == '"') ? quoteCount++ : quoteCount;
			string lineBreak = (ch == ',' && quotes % 2 == 0) ? string.Concat(ch.ToString(), Environment.NewLine, string.Concat(Enumerable.Repeat("    ", indentation))) : null;
			string openChar = (ch == '{' || ch == '[') ? string.Concat(ch.ToString(), Environment.NewLine, string.Concat(Enumerable.Repeat("    ", ++indentation))) : ch.ToString();
			string closeChar = (ch == '}' || ch == ']') ? string.Concat(Environment.NewLine, string.Concat(Enumerable.Repeat("    ", --indentation)), ch.ToString()) : ch.ToString();
			sb.Append(lineBreak ?? ((openChar.Length <= 1) ? closeChar : openChar));
		}
		return sb.ToString();
	}
}
