using System;
using System.IO;
using System.Text;
using System.Threading;
using Serilog.Core;
using Serilog.Debugging;
using Serilog.Events;
using Serilog.Formatting;

namespace Serilog.Sinks.File
{
	[Obsolete("This type will be removed from the public API in a future version; use `WriteTo.File(shared: true)` instead.")]
	public sealed class SharedFileSink : IFileSink, ILogEventSink, IFlushableFileSink, IDisposable
	{
		private readonly TextWriter _output;

		private readonly FileStream _underlyingStream;

		private readonly ITextFormatter _textFormatter;

		private readonly long? _fileSizeLimitBytes;

		private readonly object _syncRoot = new object();

		private const string MutexNameSuffix = ".serilog";

		private const int MutexWaitTimeout = 10000;

		private readonly Mutex _mutex;

		public SharedFileSink(string path, ITextFormatter textFormatter, long? fileSizeLimitBytes, Encoding encoding = null)
		{
			if (path == null)
			{
				throw new ArgumentNullException("path");
			}
			if (fileSizeLimitBytes.HasValue && fileSizeLimitBytes < 0)
			{
				throw new ArgumentException("Negative value provided; file size limit must be non-negative");
			}
			_textFormatter = textFormatter ?? throw new ArgumentNullException("textFormatter");
			_fileSizeLimitBytes = fileSizeLimitBytes;
			string directoryName = Path.GetDirectoryName(path);
			if (!string.IsNullOrWhiteSpace(directoryName) && !Directory.Exists(directoryName))
			{
				Directory.CreateDirectory(directoryName);
			}
			string name = Path.GetFullPath(path).Replace(Path.DirectorySeparatorChar, ':') + ".serilog";
			_mutex = new Mutex(initiallyOwned: false, name);
			_underlyingStream = System.IO.File.Open(path, FileMode.Append, FileAccess.Write, FileShare.ReadWrite);
			_output = new StreamWriter(_underlyingStream, encoding ?? new UTF8Encoding(encoderShouldEmitUTF8Identifier: false));
		}

		bool IFileSink.EmitOrOverflow(LogEvent logEvent)
		{
			if (logEvent == null)
			{
				throw new ArgumentNullException("logEvent");
			}
			lock (_syncRoot)
			{
				if (!TryAcquireMutex())
				{
					return true;
				}
				try
				{
					_underlyingStream.Seek(0L, SeekOrigin.End);
					if (_fileSizeLimitBytes.HasValue && _underlyingStream.Length >= _fileSizeLimitBytes.Value)
					{
						return false;
					}
					_textFormatter.Format(logEvent, _output);
					_output.Flush();
					_underlyingStream.Flush();
					return true;
				}
				finally
				{
					ReleaseMutex();
				}
			}
		}

		public void Emit(LogEvent logEvent)
		{
			((IFileSink)this).EmitOrOverflow(logEvent);
		}

		public void Dispose()
		{
			lock (_syncRoot)
			{
				_output.Dispose();
				_mutex.Dispose();
			}
		}

		public void FlushToDisk()
		{
			lock (_syncRoot)
			{
				if (!TryAcquireMutex())
				{
					return;
				}
				try
				{
					_underlyingStream.Flush(flushToDisk: true);
				}
				finally
				{
					ReleaseMutex();
				}
			}
		}

		private bool TryAcquireMutex()
		{
			try
			{
				if (!_mutex.WaitOne(10000))
				{
					SelfLog.WriteLine("Shared file mutex could not be acquired within {0} ms", 10000);
					return false;
				}
			}
			catch (AbandonedMutexException)
			{
				SelfLog.WriteLine("Inherited shared file mutex after abandonment by another process");
			}
			return true;
		}

		private void ReleaseMutex()
		{
			_mutex.ReleaseMutex();
		}
	}
}
