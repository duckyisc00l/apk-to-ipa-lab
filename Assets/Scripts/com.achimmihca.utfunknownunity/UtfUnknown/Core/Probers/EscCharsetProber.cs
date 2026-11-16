using System.Text;
using UtfUnknown.Core.Models.MultiByte.Chinese;
using UtfUnknown.Core.Models.MultiByte.Japanese;
using UtfUnknown.Core.Models.MultiByte.Korean;

namespace UtfUnknown.Core.Probers
{
	public class EscCharsetProber : CharsetProber
	{
		private const int CHARSETS_NUM = 4;

		private string detectedCharset;

		private CodingStateMachine[] codingSM;

		private int activeSM;

		public EscCharsetProber()
		{
			codingSM = new CodingStateMachine[4];
			codingSM[0] = new CodingStateMachine(new HZ_GB_2312_SMModel());
			codingSM[1] = new CodingStateMachine(new Iso_2022_CN_SMModel());
			codingSM[2] = new CodingStateMachine(new Iso_2022_JP_SMModel());
			codingSM[3] = new CodingStateMachine(new Iso_2022_KR_SMModel());
			Reset();
		}

		public override void Reset()
		{
			state = ProbingState.Detecting;
			for (int i = 0; i < 4; i++)
			{
				codingSM[i].Reset();
			}
			activeSM = 4;
			detectedCharset = null;
		}

		public override ProbingState HandleData(byte[] buf, int offset, int len)
		{
			int num = offset + len;
			for (int i = offset; i < num; i++)
			{
				if (state != ProbingState.Detecting)
				{
					break;
				}
				for (int num2 = activeSM - 1; num2 >= 0; num2--)
				{
					switch (codingSM[num2].NextState(buf[i]))
					{
					case 1:
						activeSM--;
						if (activeSM == 0)
						{
							state = ProbingState.NotMe;
							return state;
						}
						if (num2 != activeSM)
						{
							CodingStateMachine codingStateMachine = codingSM[activeSM];
							codingSM[activeSM] = codingSM[num2];
							codingSM[num2] = codingStateMachine;
						}
						break;
					case 2:
						state = ProbingState.FoundIt;
						detectedCharset = codingSM[num2].ModelName;
						return state;
					}
				}
			}
			return state;
		}

		public override string GetCharsetName()
		{
			return detectedCharset;
		}

		public override float GetConfidence(StringBuilder status = null)
		{
			return 0.99f;
		}
	}
}
