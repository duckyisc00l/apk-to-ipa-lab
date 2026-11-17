using System.IO;
using System.Text;
using UnityEngine;
using UtfUnknown;

public static class TxtReader
{
	public static StreamReader GetFileStreamReader(string path, Encoding encoding, bool useUniversalCharsetDetector)
	{
		if (path.IsNullOrEmpty() || !File.Exists(path))
		{
			throw new UnityException("Can not read file. No file exists in specified path: " + path);
		}
		if (encoding == null)
		{
			encoding = (useUniversalCharsetDetector ? GuessUnknownFileEncodingUsingUniversalCharsetDetector(path) : GuessUnicodeFileEncoding(path));
		}
		return new StreamReader(path, encoding, detectEncodingFromByteOrderMarks: true);
	}

	private static Encoding GuessUnicodeFileEncoding(string path)
	{
		byte[] array = new byte[5];
		FileStream fileStream = new FileStream(path, FileMode.Open, FileAccess.Read);
		fileStream.Read(array, 0, 5);
		fileStream.Close();
		if (array[0] == 239 && array[1] == 187 && array[2] == 191)
		{
			return Encoding.UTF8;
		}
		if (array[0] == 254 && array[1] == byte.MaxValue)
		{
			return Encoding.Unicode;
		}
		if (array[0] == 0 && array[1] == 0 && array[2] == 254 && array[3] == byte.MaxValue)
		{
			return Encoding.UTF32;
		}
		if (array[0] == 43 && array[1] == 47 && array[2] == 118)
		{
			return Encoding.UTF7;
		}
		return Encoding.UTF8;
	}

	private static Encoding GuessUnknownFileEncodingUsingUniversalCharsetDetector(string filePath)
	{
		DetectionResult detectionResult = CharsetDetector.DetectFromFile(filePath);
		Encoding encoding = detectionResult.Detected.Encoding;
		string encodingName = detectionResult.Detected.EncodingName;
		float confidence = detectionResult.Detected.Confidence;
		if (encoding != null && confidence > 0.6f)
		{
			return encoding;
		}
		Debug.LogWarning($"Could not determine encoding of file '{filePath}' with high confidence, using UTF8 as fallback. Encoding detection result was: encoding name: '{encodingName}', C# object '{encoding}', confidence: {confidence}");
		return Encoding.UTF8;
	}
}
