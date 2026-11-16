using System;
using System.IO;

namespace Serilog.Debugging
{
	public static class SelfLog
	{
		private static Action<string> _output;

		[Obsolete("Use SelfLog.Enable(value) and SelfLog.Disable() instead")]
		public static TextWriter Out
		{
			set
			{
				if (value != null)
				{
					Enable(value);
				}
				else
				{
					Disable();
				}
			}
		}

		public static void Enable(TextWriter output)
		{
			if (output == null)
			{
				throw new ArgumentNullException("output");
			}
			Enable((string m) =>
			{
				output.WriteLine(m);
				output.Flush();
			});
		}

		public static void Enable(Action<string> output)
		{
			_output = output ?? throw new ArgumentNullException("output");
		}

		public static void Disable()
		{
			_output = null;
		}

		public static void WriteLine(string format, object arg0 = null, object arg1 = null, object arg2 = null)
		{
			_output?.Invoke(string.Format(DateTime.UtcNow.ToString("o") + " " + format, arg0, arg1, arg2));
		}
	}
}
