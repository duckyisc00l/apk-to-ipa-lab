using System;
using System.Collections.Generic;
using System.Text;
using UtfUnknown.Core.Probers;

namespace UtfUnknown
{
	public class DetectionDetail
	{
		private static readonly Dictionary<string, string> FixedToSupportCodepageName = new Dictionary<string, string>
		{
			{ "cp949", "ks_c_5601-1987" },
			{ "iso-2022-cn", "x-cp50227" }
		};

		public string EncodingName { get; }

		public Encoding Encoding { get; set; }

		public float Confidence { get; set; }

		public CharsetProber Prober { get; set; }

		public bool HasBOM { get; set; }

		public TimeSpan? Time { get; set; }

		public string StatusLog { get; set; }

		public DetectionDetail(string encodingShortName, float confidence, CharsetProber prober = null, TimeSpan? time = null, string statusLog = null)
		{
			EncodingName = encodingShortName;
			Confidence = confidence;
			Encoding = GetEncoding(encodingShortName);
			Prober = prober;
			Time = time;
			StatusLog = statusLog;
		}

		public DetectionDetail(CharsetProber prober, TimeSpan? time = null)
			: this(prober.GetCharsetName(), prober.GetConfidence(), prober, time, prober.DumpStatus())
		{
		}

		public override string ToString()
		{
			return $"Detected {EncodingName} with confidence of {Confidence}. (BOM: {HasBOM})";
		}

		internal static Encoding GetEncoding(string encodingShortName)
		{
			string name = (FixedToSupportCodepageName.TryGetValue(encodingShortName, out var value) ? value : encodingShortName);
			try
			{
				return Encoding.GetEncoding(name);
			}
			catch (Exception ex) when (ex is ArgumentException || ex is NotSupportedException)
			{
				return null;
			}
		}
	}
}
