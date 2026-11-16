using System.Net;
using System.Text;

namespace SimpleHttpServerForUnity
{
	public static class HttpListenerResponseExtensions
	{
		public static void SendResponse(this HttpListenerResponse response, string responseBody)
		{
			byte[] bytes = Encoding.UTF8.GetBytes(responseBody);
			response.OutputStream.Write(bytes, 0, bytes.Length);
		}

		public static void SendResponse(this HttpListenerResponse response, string responseBody, HttpStatusCode statusCodeEnum)
		{
			response.SetStatusCode(statusCodeEnum);
			response.SendResponse(responseBody);
		}

		public static void SetStatusCode(this HttpListenerResponse response, HttpStatusCode statusCodeEnum)
		{
			response.StatusCode = (int)statusCodeEnum;
		}
	}
}
