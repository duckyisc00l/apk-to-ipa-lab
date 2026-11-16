using System;
using System.Collections.Generic;
using System.Linq;

namespace UniInject
{
	public class InjectionException : Exception
	{
		private const string MessageSeparator = "\n    ";

		public List<Exception> CauseExceptionList { get; private set; }

		public InjectionException(string message, List<Exception> causeExceptionList)
			: base(message + "\n    " + CreateMergedExceptionMessage(causeExceptionList))
		{
			CauseExceptionList = causeExceptionList;
		}

		private static string CreateMergedExceptionMessage(List<Exception> causeExceptionList)
		{
			List<string> values = causeExceptionList.Select((Exception ex) => CreateDeepExceptionMessage(ex)).ToList();
			return string.Join("\n    ", values);
			static string CreateDeepExceptionMessage(Exception ex)
			{
				string text = ((ex.InnerException != null) ? ("\n        Caused by: " + CreateDeepExceptionMessage(ex.InnerException)) : "");
				return ex.Message + text;
			}
		}

		public InjectionException(string message)
			: base(message)
		{
		}

		public InjectionException(string message, Exception e)
			: base(message, e)
		{
		}
	}
}
