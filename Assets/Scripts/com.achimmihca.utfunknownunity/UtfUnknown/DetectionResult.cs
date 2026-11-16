using System.Collections.Generic;
using System.Linq;

namespace UtfUnknown
{
	public class DetectionResult
	{
		public DetectionDetail Detected => Details?.FirstOrDefault();

		public IList<DetectionDetail> Details { get; set; }

		public DetectionResult()
		{
		}

		public DetectionResult(IList<DetectionDetail> details)
		{
			Details = details;
		}

		public DetectionResult(DetectionDetail detectionDetail)
		{
			Details = new List<DetectionDetail> { detectionDetail };
		}

		public override string ToString()
		{
			return string.Format("{0}: {1}, \n{2}:\n - {3}", "Detected", Detected, "Details", string.Join("\n- ", Details?.Select((DetectionDetail d) => d.ToString())));
		}
	}
}
