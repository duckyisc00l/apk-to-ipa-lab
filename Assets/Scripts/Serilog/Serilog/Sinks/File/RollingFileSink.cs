using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using Serilog.Core;
using Serilog.Debugging;
using Serilog.Events;
using Serilog.Formatting;

namespace Serilog.Sinks.File
{
	internal sealed class RollingFileSink : ILogEventSink, IFlushableFileSink, IDisposable
	{
		private readonly PathRoller _roller;

		private readonly ITextFormatter _textFormatter;

		private readonly long? _fileSizeLimitBytes;

		private readonly int? _retainedFileCountLimit;

		private readonly Encoding _encoding;

		private readonly bool _buffered;

		private readonly bool _shared;

		private readonly bool _rollOnFileSizeLimit;

		private readonly FileLifecycleHooks _hooks;

		private readonly object _syncRoot = new object();

		private bool _isDisposed;

		private DateTime? _nextCheckpoint;

		private IFileSink _currentFile;

		private int? _currentFileSequence;

		public RollingFileSink(string path, ITextFormatter textFormatter, long? fileSizeLimitBytes, int? retainedFileCountLimit, Encoding encoding, bool buffered, bool shared, RollingInterval rollingInterval, bool rollOnFileSizeLimit, FileLifecycleHooks hooks)
		{
			if (path == null)
			{
				throw new ArgumentNullException("path");
			}
			if (fileSizeLimitBytes.HasValue && fileSizeLimitBytes < 0)
			{
				throw new ArgumentException("Negative value provided; file size limit must be non-negative.");
			}
			if (retainedFileCountLimit.HasValue && retainedFileCountLimit < 1)
			{
				throw new ArgumentException("Zero or negative value provided; retained file count limit must be at least 1.");
			}
			_roller = new PathRoller(path, rollingInterval);
			_textFormatter = textFormatter;
			_fileSizeLimitBytes = fileSizeLimitBytes;
			_retainedFileCountLimit = retainedFileCountLimit;
			_encoding = encoding;
			_buffered = buffered;
			_shared = shared;
			_rollOnFileSizeLimit = rollOnFileSizeLimit;
			_hooks = hooks;
		}

		public void Emit(LogEvent logEvent)
		{
			if (logEvent == null)
			{
				throw new ArgumentNullException("logEvent");
			}
			lock (_syncRoot)
			{
				if (_isDisposed)
				{
					throw new ObjectDisposedException("The log file has been disposed.");
				}
				DateTime dateTimeNow = Clock.DateTimeNow;
				AlignCurrentFileTo(dateTimeNow);
				while (true)
				{
					IFileSink currentFile = _currentFile;
					if (currentFile != null && !currentFile.EmitOrOverflow(logEvent) && _rollOnFileSizeLimit)
					{
						AlignCurrentFileTo(dateTimeNow, nextSequence: true);
						continue;
					}
					break;
				}
			}
		}

		private void AlignCurrentFileTo(DateTime now, bool nextSequence = false)
		{
			if (!_nextCheckpoint.HasValue)
			{
				OpenFile(now);
			}
			else if (nextSequence || now >= _nextCheckpoint.Value)
			{
				int? minSequence = null;
				if (nextSequence)
				{
					minSequence = (_currentFileSequence.HasValue ? new int?(_currentFileSequence.Value + 1) : new int?(1));
				}
				CloseFile();
				OpenFile(now, minSequence);
			}
		}

		private void OpenFile(DateTime now, int? minSequence = null)
		{
			DateTime? currentCheckpoint = _roller.GetCurrentCheckpoint(now);
			_nextCheckpoint = _roller.GetNextCheckpoint(now) ?? now.AddMinutes(30.0);
			IEnumerable<string> filenames = Enumerable.Empty<string>();
			try
			{
				if (Directory.Exists(_roller.LogFileDirectory))
				{
					filenames = Directory.GetFiles(_roller.LogFileDirectory, _roller.DirectorySearchPattern).Select(Path.GetFileName);
				}
			}
			catch (DirectoryNotFoundException)
			{
			}
			int? num = (from m in _roller.SelectMatches(filenames).Where((RollingLogFile m) =>
				{
					DateTime? dateTime = m.DateTime;
					DateTime? dateTime2 = currentCheckpoint;
					if (dateTime.HasValue != dateTime2.HasValue)
					{
						return false;
					}
					return !dateTime.HasValue || dateTime.GetValueOrDefault() == dateTime2.GetValueOrDefault();
				})
				orderby m.SequenceNumber descending
				select m).FirstOrDefault()?.SequenceNumber;
			if (minSequence.HasValue && (!num.HasValue || num.Value < minSequence.Value))
			{
				num = minSequence;
			}
			for (int num2 = 0; num2 < 3; num2++)
			{
				_roller.GetLogFilePath(now, num, out var path);
				try
				{
					IFileSink currentFile;
					if (!_shared)
					{
						IFileSink fileSink = new FileSink(path, _textFormatter, _fileSizeLimitBytes, _encoding, _buffered, _hooks);
						currentFile = fileSink;
					}
					else
					{
						IFileSink fileSink = new SharedFileSink(path, _textFormatter, _fileSizeLimitBytes, _encoding);
						currentFile = fileSink;
					}
					_currentFile = currentFile;
					_currentFileSequence = num;
				}
				catch (IOException ex2)
				{
					if (IOErrors.IsLockedFile(ex2))
					{
						SelfLog.WriteLine("File target {0} was locked, attempting to open next in sequence (attempt {1})", path, num2 + 1);
						num = num.GetValueOrDefault() + 1;
						continue;
					}
					throw;
				}
				ApplyRetentionPolicy(path);
				break;
			}
		}

		private void ApplyRetentionPolicy(string currentFilePath)
		{
			if (!_retainedFileCountLimit.HasValue)
			{
				return;
			}
			string currentFileName = Path.GetFileName(currentFilePath);
			IEnumerable<string> filenames = Directory.GetFiles(_roller.LogFileDirectory, _roller.DirectorySearchPattern).Select(Path.GetFileName).Union(new string[1] { currentFileName });
			foreach (string item in (from m in _roller.SelectMatches(filenames)
				orderby m.DateTime descending, m.SequenceNumber descending
				select m.Filename into n
				where StringComparer.OrdinalIgnoreCase.Compare(currentFileName, n) != 0
				select n).Skip(_retainedFileCountLimit.Value - 1).ToList())
			{
				string text = Path.Combine(_roller.LogFileDirectory, item);
				try
				{
					_hooks?.OnFileDeleting(text);
					System.IO.File.Delete(text);
				}
				catch (Exception arg)
				{
					SelfLog.WriteLine("Error {0} while processing obsolete log file {1}", arg, text);
				}
			}
		}

		public void Dispose()
		{
			lock (_syncRoot)
			{
				if (_currentFile != null)
				{
					CloseFile();
					_isDisposed = true;
				}
			}
		}

		private void CloseFile()
		{
			if (_currentFile != null)
			{
				(_currentFile as IDisposable)?.Dispose();
				_currentFile = null;
			}
			_nextCheckpoint = null;
		}

		public void FlushToDisk()
		{
			lock (_syncRoot)
			{
				_currentFile?.FlushToDisk();
			}
		}
	}
}
