using System.Text;
using UtfUnknown.Core.Analyzers.Korean;
using UtfUnknown.Core.Models.MultiByte.Korean;

namespace UtfUnknown.Core.Probers.MultiByte.Korean
{
	public class EUCKRProber : CharsetProber
	{
		private CodingStateMachine codingSM;

		private EUCKRDistributionAnalyser distributionAnalyser;

		private byte[] lastChar = new byte[2];

		public EUCKRProber()
		{
			codingSM = new CodingStateMachine(new EUCKRSMModel());
			distributionAnalyser = new EUCKRDistributionAnalyser();
			Reset();
		}

		public override string GetCharsetName()
		{
			return "euc-kr";
		}

		public override ProbingState HandleData(byte[] buf, int offset, int len)
		{
			int num = offset + len;
			for (int i = offset; i < num; i++)
			{
				switch (codingSM.NextState(buf[i]))
				{
				case 1:
					state = ProbingState.NotMe;
					break;
				case 2:
					state = ProbingState.FoundIt;
					break;
				case 0:
				{
					int currentCharLen = codingSM.CurrentCharLen;
					if (i == offset)
					{
						lastChar[1] = buf[offset];
						distributionAnalyser.HandleOneChar(lastChar, 0, currentCharLen);
					}
					else
					{
						distributionAnalyser.HandleOneChar(buf, i - 1, currentCharLen);
					}
					continue;
				}
				default:
					continue;
				}
				break;
			}
			lastChar[0] = buf[num - 1];
			if (state == ProbingState.Detecting && distributionAnalyser.GotEnoughData() && GetConfidence() > 0.95f)
			{
				state = ProbingState.FoundIt;
			}
			return state;
		}

		public override float GetConfidence(StringBuilder status = null)
		{
			return distributionAnalyser.GetConfidence();
		}

		public override void Reset()
		{
			codingSM.Reset();
			state = ProbingState.Detecting;
			distributionAnalyser.Reset();
		}
	}
}
