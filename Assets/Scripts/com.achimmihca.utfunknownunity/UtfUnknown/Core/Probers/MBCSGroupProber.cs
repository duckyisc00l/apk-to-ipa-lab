using System.Text;
using UtfUnknown.Core.Probers.MultiByte;
using UtfUnknown.Core.Probers.MultiByte.Chinese;
using UtfUnknown.Core.Probers.MultiByte.Japanese;
using UtfUnknown.Core.Probers.MultiByte.Korean;

namespace UtfUnknown.Core.Probers
{
	public class MBCSGroupProber : CharsetProber
	{
		private const int PROBERS_NUM = 8;

		private CharsetProber[] probers = new CharsetProber[8];

		private bool[] isActive = new bool[8];

		private int bestGuess;

		private int activeNum;

		public MBCSGroupProber()
		{
			probers[0] = new UTF8Prober();
			probers[1] = new SJISProber();
			probers[2] = new EUCJPProber();
			probers[3] = new GB18030Prober();
			probers[4] = new EUCKRProber();
			probers[5] = new CP949Prober();
			probers[6] = new Big5Prober();
			probers[7] = new EUCTWProber();
			Reset();
		}

		public override string GetCharsetName()
		{
			if (bestGuess == -1)
			{
				GetConfidence();
				if (bestGuess == -1)
				{
					bestGuess = 0;
				}
			}
			return probers[bestGuess].GetCharsetName();
		}

		public override void Reset()
		{
			activeNum = 0;
			for (int i = 0; i < probers.Length; i++)
			{
				if (probers[i] != null)
				{
					probers[i].Reset();
					isActive[i] = true;
					activeNum++;
				}
				else
				{
					isActive[i] = false;
				}
			}
			bestGuess = -1;
			state = ProbingState.Detecting;
		}

		public override ProbingState HandleData(byte[] buf, int offset, int len)
		{
			byte[] array = new byte[len];
			int len2 = 0;
			bool flag = true;
			int num = offset + len;
			for (int i = offset; i < num; i++)
			{
				if ((buf[i] & 0x80) != 0)
				{
					array[len2++] = buf[i];
					flag = true;
				}
				else if (flag)
				{
					array[len2++] = buf[i];
					flag = false;
				}
			}
			for (int j = 0; j < probers.Length; j++)
			{
				if (!isActive[j])
				{
					continue;
				}
				switch (probers[j].HandleData(array, 0, len2))
				{
				case ProbingState.FoundIt:
					bestGuess = j;
					state = ProbingState.FoundIt;
					break;
				case ProbingState.NotMe:
					isActive[j] = false;
					activeNum--;
					if (activeNum > 0)
					{
						continue;
					}
					state = ProbingState.NotMe;
					break;
				default:
					continue;
				}
				break;
			}
			return state;
		}

		public override float GetConfidence(StringBuilder status = null)
		{
			float num = 0f;
			switch (state)
			{
			case ProbingState.FoundIt:
				return 0.99f;
			case ProbingState.NotMe:
				return 0.01f;
			default:
			{
				status?.AppendLine("Get confidence:");
				for (int i = 0; i < 8; i++)
				{
					if (isActive[i])
					{
						float confidence = probers[i].GetConfidence();
						if (num < confidence)
						{
							num = confidence;
							bestGuess = i;
							status?.AppendLine($"-- new match found: confidence {num}, index {bestGuess}, charset {probers[i].GetCharsetName()}.");
						}
					}
				}
				status?.AppendLine("Get confidence done.");
				return num;
			}
			}
		}

		public override string DumpStatus()
		{
			StringBuilder stringBuilder = new StringBuilder();
			float confidence = GetConfidence(stringBuilder);
			stringBuilder.AppendLine(" MBCS Group Prober --------begin status");
			for (int i = 0; i < 8; i++)
			{
				if (probers[i] != null)
				{
					if (!isActive[i])
					{
						stringBuilder.AppendLine(" MBCS inactive: " + probers[i].GetCharsetName() + " (i.e. confidence is too low).");
						continue;
					}
					float confidence2 = probers[i].GetConfidence();
					stringBuilder.AppendLine($" MBCS {confidence2}: [{probers[i].GetCharsetName()}]");
					stringBuilder.AppendLine(probers[i].DumpStatus());
				}
			}
			stringBuilder.AppendLine($" MBCS Group found best match [{probers[bestGuess].GetCharsetName()}] confidence {confidence}.");
			return stringBuilder.ToString();
		}
	}
}
