using System.IO;
using System.Text;

namespace Serilog.Sinks.File
{
	public abstract class FileLifecycleHooks
	{
		public virtual Stream OnFileOpened(Stream underlyingStream, Encoding encoding)
		{
			return underlyingStream;
		}

		public virtual void OnFileDeleting(string path)
		{
		}
	}
}
