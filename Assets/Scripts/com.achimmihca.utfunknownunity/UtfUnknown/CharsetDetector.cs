using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using UtfUnknown.Core;
using UtfUnknown.Core.Probers;

namespace UtfUnknown
{
	public class CharsetDetector
	{
		internal InputState InputState;

		private bool _start;

		private bool _gotData;

		private bool _done;

		private byte _lastChar;

		private IList<CharsetProber> _charsetProbers;

		private IList<CharsetProber> _escCharsetProber;

		private DetectionDetail _detectionDetail;

		private const float MinimumThreshold = 0.2f;

		private IList<CharsetProber> CharsetProbers => InputState switch
		{
			InputState.EscASCII => _escCharsetProber, 
			InputState.Highbyte => _charsetProbers, 
			_ => new List<CharsetProber>(), 
		};

		private CharsetDetector()
		{
			_start = true;
			InputState = InputState.PureASCII;
			_lastChar = 0;
		}

		public static DetectionResult DetectFromBytes(byte[] bytes)
		{
			if (bytes == null)
			{
				throw new ArgumentNullException("bytes");
			}
			CharsetDetector charsetDetector = new CharsetDetector();
			charsetDetector.Feed(bytes, 0, bytes.Length);
			return charsetDetector.DataEnd();
		}

		public static DetectionResult DetectFromBytes(byte[] bytes, int offset, int len)
		{
			if (bytes == null)
			{
				throw new ArgumentNullException("bytes");
			}
			if (offset < 0)
			{
				throw new ArgumentOutOfRangeException("offset");
			}
			if (len < 0)
			{
				throw new ArgumentOutOfRangeException("len");
			}
			if (bytes.Length < offset + len)
			{
				throw new ArgumentException("len is greater than the number of bytes from offset to the end of the array.");
			}
			CharsetDetector charsetDetector = new CharsetDetector();
			charsetDetector.Feed(bytes, offset, len);
			return charsetDetector.DataEnd();
		}

		public static DetectionResult DetectFromStream(Stream stream)
		{
			if (stream == null)
			{
				throw new ArgumentNullException("stream");
			}
			return DetectFromStream(stream, null);
		}

		public static DetectionResult DetectFromStream(Stream stream, long? maxBytesToRead)
		{
			if (stream == null)
			{
				throw new ArgumentNullException("stream");
			}
			if (maxBytesToRead <= 0)
			{
				throw new ArgumentOutOfRangeException("maxBytesToRead");
			}
			CharsetDetector charsetDetector = new CharsetDetector();
			ReadStream(stream, maxBytesToRead, charsetDetector);
			return charsetDetector.DataEnd();
		}

		private static void ReadStream(Stream stream, long? maxBytes, CharsetDetector detector)
		{
			byte[] array = new byte[1024];
			long num = 0L;
			int count = CalcToRead(maxBytes, num, 1024);
			int num2;
			while ((num2 = stream.Read(array, 0, count)) > 0)
			{
				detector.Feed(array, 0, num2);
				if (maxBytes.HasValue)
				{
					num += num2;
					if (num >= maxBytes)
					{
						break;
					}
					count = CalcToRead(maxBytes, num, 1024);
				}
				if (detector._done)
				{
					break;
				}
			}
		}

		private static int CalcToRead(long? maxBytes, long readTotal, int bufferSize)
		{
			if (readTotal + bufferSize > maxBytes)
			{
				return (int)maxBytes.Value - (int)readTotal;
			}
			return bufferSize;
		}

		public static DetectionResult DetectFromFile(string filePath)
		{
			if (filePath == null)
			{
				throw new ArgumentNullException("filePath");
			}
			using FileStream stream = new FileStream(filePath, FileMode.Open, FileAccess.Read, FileShare.ReadWrite);
			return DetectFromStream(stream);
		}

		public static DetectionResult DetectFromFile(FileInfo file)
		{
			if (file == null)
			{
				throw new ArgumentNullException("file");
			}
			using FileStream stream = new FileStream(file.FullName, FileMode.Open, FileAccess.Read, FileShare.ReadWrite);
			return DetectFromStream(stream);
		}

		protected virtual void Feed(byte[] buf, int offset, int len)
		{
			if (_done)
			{
				return;
			}
			if (len > 0)
			{
				_gotData = true;
			}
			if (_start)
			{
				_start = false;
				_done = IsStartsWithBom(buf, offset, len);
				if (_done)
				{
					return;
				}
			}
			FindInputState(buf, offset, len);
			foreach (CharsetProber charsetProber in CharsetProbers)
			{
				_done = RunProber(buf, offset, len, charsetProber);
				if (_done)
				{
					break;
				}
			}
		}

		private bool IsStartsWithBom(byte[] buf, int offset, int len)
		{
			string text = FindCharSetByBom(buf, offset, len);
			if (text != null)
			{
				_detectionDetail = new DetectionDetail(text, 1f)
				{
					HasBOM = true
				};
				return true;
			}
			return false;
		}

		private bool RunProber(byte[] buf, int offset, int len, CharsetProber charsetProber)
		{
			if (charsetProber.HandleData(buf, offset, len) == ProbingState.FoundIt)
			{
				_detectionDetail = new DetectionDetail(charsetProber);
				return true;
			}
			return false;
		}

		private void FindInputState(byte[] buf, int offset, int len)
		{
			for (int i = offset; i < len; i++)
			{
				if ((buf[i] & 0x80) != 0 && buf[i] != 160)
				{
					if (InputState != InputState.Highbyte)
					{
						InputState = InputState.Highbyte;
						_escCharsetProber = null;
						_charsetProbers = _charsetProbers ?? GetNewProbers();
					}
				}
				else
				{
					if (InputState == InputState.PureASCII && (buf[i] == 27 || (buf[i] == 123 && _lastChar == 126)))
					{
						InputState = InputState.EscASCII;
						_escCharsetProber = _escCharsetProber ?? GetNewProbers();
					}
					_lastChar = buf[i];
				}
			}
		}

		private static string FindCharSetByBom(byte[] buf, int offset, int len)
		{
			if (len < 2)
			{
				return null;
			}
			byte b = buf[offset];
			byte b2 = buf[offset + 1];
			if (b == 254 && b2 == byte.MaxValue)
			{
				if (len <= 3 || buf[offset + 2] != 0 || buf[offset + 3] != 0)
				{
					return "utf-16be";
				}
				return "X-ISO-10646-UCS-4-3412";
			}
			if (b == byte.MaxValue && b2 == 254)
			{
				if (len <= 3 || buf[offset + 2] != 0 || buf[offset + 3] != 0)
				{
					return "utf-16le";
				}
				return "utf-32le";
			}
			if (len < 3)
			{
				return null;
			}
			if (b == 239 && b2 == 187 && buf[offset + 2] == 191)
			{
				return "utf-8";
			}
			if (len < 4)
			{
				return null;
			}
			if (b == 0 && b2 == 0)
			{
				if (buf[offset + 2] == 254 && buf[offset + 3] == byte.MaxValue)
				{
					return "utf-32be";
				}
				if (buf[offset + 2] == byte.MaxValue && buf[offset + 3] == 254)
				{
					return "X-ISO-10646-UCS-4-2143";
				}
			}
			if (b == 43 && b2 == 47 && buf[offset + 2] == 118 && (buf[offset + 3] == 56 || buf[offset + 3] == 57 || buf[offset + 3] == 43 || buf[offset + 3] == 47))
			{
				return "utf-7";
			}
			if (b == 132 && b2 == 49 && buf[offset + 2] == 149 && buf[offset + 3] == 51)
			{
				return "gb18030";
			}
			return null;
		}

		private DetectionResult DataEnd()
		{
			if (!_gotData)
			{
				return new DetectionResult();
			}
			if (_detectionDetail != null)
			{
				_done = true;
				_detectionDetail.Confidence = 1f;
				return new DetectionResult(_detectionDetail);
			}
			if (InputState == InputState.Highbyte)
			{
				return new DetectionResult((from prober in _charsetProbers
					select new DetectionDetail(prober) into result
					where result.Confidence > 0.2f
					orderby result.Confidence descending
					select result).ToList());
			}
			if (InputState == InputState.PureASCII)
			{
				return new DetectionResult(new DetectionDetail("ascii", 1f));
			}
			if (InputState == InputState.EscASCII)
			{
				return new DetectionResult(new DetectionDetail("ascii", 1f));
			}
			return new DetectionResult();
		}

		internal IList<CharsetProber> GetNewProbers()
		{
			return InputState switch
			{
				InputState.EscASCII => new List<CharsetProber>
				{
					new EscCharsetProber()
				}, 
				InputState.Highbyte => new List<CharsetProber>
				{
					new MBCSGroupProber(),
					new SBCSGroupProber(),
					new Latin1Prober()
				}, 
				_ => new List<CharsetProber>(), 
			};
		}
	}
}
