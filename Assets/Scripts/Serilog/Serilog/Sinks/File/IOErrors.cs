using System.IO;

namespace Serilog.Sinks.File
{
	internal static class IOErrors
	{
		public static bool IsLockedFile(IOException ex)
		{
			return true;
		}
	}
}
