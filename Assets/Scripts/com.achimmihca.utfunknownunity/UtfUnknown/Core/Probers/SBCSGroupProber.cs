using System.Text;
using UtfUnknown.Core.Models.SingleByte.Arabic;
using UtfUnknown.Core.Models.SingleByte.Bulgarian;
using UtfUnknown.Core.Models.SingleByte.Croatian;
using UtfUnknown.Core.Models.SingleByte.Czech;
using UtfUnknown.Core.Models.SingleByte.Danish;
using UtfUnknown.Core.Models.SingleByte.Esperanto;
using UtfUnknown.Core.Models.SingleByte.Estonian;
using UtfUnknown.Core.Models.SingleByte.Finnish;
using UtfUnknown.Core.Models.SingleByte.French;
using UtfUnknown.Core.Models.SingleByte.German;
using UtfUnknown.Core.Models.SingleByte.Greek;
using UtfUnknown.Core.Models.SingleByte.Hebrew;
using UtfUnknown.Core.Models.SingleByte.Hungarian;
using UtfUnknown.Core.Models.SingleByte.Irish;
using UtfUnknown.Core.Models.SingleByte.Italian;
using UtfUnknown.Core.Models.SingleByte.Latvian;
using UtfUnknown.Core.Models.SingleByte.Lithuanian;
using UtfUnknown.Core.Models.SingleByte.Maltese;
using UtfUnknown.Core.Models.SingleByte.Polish;
using UtfUnknown.Core.Models.SingleByte.Portuguese;
using UtfUnknown.Core.Models.SingleByte.Romanian;
using UtfUnknown.Core.Models.SingleByte.Russian;
using UtfUnknown.Core.Models.SingleByte.Slovak;
using UtfUnknown.Core.Models.SingleByte.Slovene;
using UtfUnknown.Core.Models.SingleByte.Spanish;
using UtfUnknown.Core.Models.SingleByte.Swedish;
using UtfUnknown.Core.Models.SingleByte.Thai;
using UtfUnknown.Core.Models.SingleByte.Turkish;
using UtfUnknown.Core.Models.SingleByte.Vietnamese;

namespace UtfUnknown.Core.Probers
{
	public class SBCSGroupProber : CharsetProber
	{
		private const int PROBERS_NUM = 100;

		private CharsetProber[] probers = new CharsetProber[100];

		private bool[] isActive = new bool[100];

		private int bestGuess;

		private int activeNum;

		public SBCSGroupProber()
		{
			probers[0] = new SingleByteCharSetProber(new Windows_1251_RussianModel());
			probers[1] = new SingleByteCharSetProber(new Koi8r_Model());
			probers[2] = new SingleByteCharSetProber(new Iso_8859_5_RussianModel());
			probers[3] = new SingleByteCharSetProber(new X_Mac_Cyrillic_RussianModel());
			probers[4] = new SingleByteCharSetProber(new Ibm866_RussianModel());
			probers[5] = new SingleByteCharSetProber(new Ibm855_RussianModel());
			probers[6] = new SingleByteCharSetProber(new Iso_8859_7_GreekModel());
			probers[7] = new SingleByteCharSetProber(new Windows_1253_GreekModel());
			probers[8] = new SingleByteCharSetProber(new Iso_8859_5_BulgarianModel());
			probers[9] = new SingleByteCharSetProber(new Windows_1251_BulgarianModel());
			HebrewProber hebrewProber = new HebrewProber();
			probers[10] = hebrewProber;
			probers[11] = new SingleByteCharSetProber(new Windows_1255_HebrewModel(), reversed: false, hebrewProber);
			probers[12] = new SingleByteCharSetProber(new Windows_1255_HebrewModel(), reversed: true, hebrewProber);
			hebrewProber.SetModelProbers(probers[11], probers[12]);
			probers[13] = new SingleByteCharSetProber(new Tis_620_ThaiModel());
			probers[14] = new SingleByteCharSetProber(new Iso_8859_11_ThaiModel());
			probers[15] = new SingleByteCharSetProber(new Iso_8859_1_FrenchModel());
			probers[16] = new SingleByteCharSetProber(new Iso_8859_15_FrenchModel());
			probers[17] = new SingleByteCharSetProber(new Windows_1252_FrenchModel());
			probers[18] = new SingleByteCharSetProber(new Iso_8859_1_SpanishModel());
			probers[19] = new SingleByteCharSetProber(new Iso_8859_15_SpanishModel());
			probers[20] = new SingleByteCharSetProber(new Windows_1252_SpanishModel());
			probers[21] = new SingleByteCharSetProber(new Iso_8859_2_HungarianModel());
			probers[22] = new SingleByteCharSetProber(new Windows_1250_HungarianModel());
			probers[23] = new SingleByteCharSetProber(new Iso_8859_1_GermanModel());
			probers[24] = new SingleByteCharSetProber(new Windows_1252_GermanModel());
			probers[25] = new SingleByteCharSetProber(new Iso_8859_3_EsperantoModel());
			probers[26] = new SingleByteCharSetProber(new Iso_8859_3_TurkishModel());
			probers[27] = new SingleByteCharSetProber(new Iso_8859_9_TurkishModel());
			probers[28] = new SingleByteCharSetProber(new Iso_8859_6_ArabicModel());
			probers[29] = new SingleByteCharSetProber(new Windows_1256_ArabicModel());
			probers[30] = new SingleByteCharSetProber(new Viscii_VietnameseModel());
			probers[31] = new SingleByteCharSetProber(new Windows_1258_VietnameseModel());
			probers[32] = new SingleByteCharSetProber(new Iso_8859_15_DanishModel());
			probers[33] = new SingleByteCharSetProber(new Iso_8859_1_DanishModel());
			probers[34] = new SingleByteCharSetProber(new Windows_1252_DanishModel());
			probers[35] = new SingleByteCharSetProber(new Iso_8859_13_LithuanianModel());
			probers[36] = new SingleByteCharSetProber(new Iso_8859_10_LithuanianModel());
			probers[37] = new SingleByteCharSetProber(new Iso_8859_4_LithuanianModel());
			probers[38] = new SingleByteCharSetProber(new Iso_8859_13_LatvianModel());
			probers[39] = new SingleByteCharSetProber(new Iso_8859_10_LatvianModel());
			probers[40] = new SingleByteCharSetProber(new Iso_8859_4_LatvianModel());
			probers[41] = new SingleByteCharSetProber(new Iso_8859_1_PortugueseModel());
			probers[42] = new SingleByteCharSetProber(new Iso_8859_9_PortugueseModel());
			probers[43] = new SingleByteCharSetProber(new Iso_8859_15_PortugueseModel());
			probers[44] = new SingleByteCharSetProber(new Windows_1252_PortugueseModel());
			probers[45] = new SingleByteCharSetProber(new Iso_8859_3_MalteseModel());
			probers[46] = new SingleByteCharSetProber(new Windows_1250_CzechModel());
			probers[47] = new SingleByteCharSetProber(new Iso_8859_2_CzechModel());
			probers[48] = new SingleByteCharSetProber(new Mac_Centraleurope_CzechModel());
			probers[49] = new SingleByteCharSetProber(new Ibm852_CzechModel());
			probers[50] = new SingleByteCharSetProber(new Windows_1250_SlovakModel());
			probers[51] = new SingleByteCharSetProber(new Iso_8859_2_SlovakModel());
			probers[52] = new SingleByteCharSetProber(new Mac_Centraleurope_SlovakModel());
			probers[53] = new SingleByteCharSetProber(new Ibm852_SlovakModel());
			probers[54] = new SingleByteCharSetProber(new Windows_1250_PolishModel());
			probers[55] = new SingleByteCharSetProber(new Iso_8859_2_PolishModel());
			probers[56] = new SingleByteCharSetProber(new Iso_8859_13_PolishModel());
			probers[57] = new SingleByteCharSetProber(new Iso_8859_16_PolishModel());
			probers[58] = new SingleByteCharSetProber(new Mac_Centraleurope_PolishModel());
			probers[59] = new SingleByteCharSetProber(new Ibm852_PolishModel());
			probers[60] = new SingleByteCharSetProber(new Iso_8859_1_FinnishModel());
			probers[61] = new SingleByteCharSetProber(new Iso_8859_4_FinnishModel());
			probers[62] = new SingleByteCharSetProber(new Iso_8859_9_FinnishModel());
			probers[63] = new SingleByteCharSetProber(new Iso_8859_13_FinnishModel());
			probers[64] = new SingleByteCharSetProber(new Iso_8859_15_FinnishModel());
			probers[65] = new SingleByteCharSetProber(new Windows_1252_FinnishModel());
			probers[66] = new SingleByteCharSetProber(new Iso_8859_1_ItalianModel());
			probers[67] = new SingleByteCharSetProber(new Iso_8859_3_ItalianModel());
			probers[68] = new SingleByteCharSetProber(new Iso_8859_9_ItalianModel());
			probers[69] = new SingleByteCharSetProber(new Iso_8859_15_ItalianModel());
			probers[70] = new SingleByteCharSetProber(new Windows_1252_ItalianModel());
			probers[71] = new SingleByteCharSetProber(new Windows_1250_CroatianModel());
			probers[72] = new SingleByteCharSetProber(new Iso_8859_2_CroatianModel());
			probers[73] = new SingleByteCharSetProber(new Iso_8859_13_CroatianModel());
			probers[74] = new SingleByteCharSetProber(new Iso_8859_16_CroatianModel());
			probers[75] = new SingleByteCharSetProber(new Mac_Centraleurope_CroatianModel());
			probers[76] = new SingleByteCharSetProber(new Ibm852_CroatianModel());
			probers[77] = new SingleByteCharSetProber(new Windows_1252_EstonianModel());
			probers[78] = new SingleByteCharSetProber(new Windows_1257_EstonianModel());
			probers[79] = new SingleByteCharSetProber(new Iso_8859_4_EstonianModel());
			probers[80] = new SingleByteCharSetProber(new Iso_8859_13_EstonianModel());
			probers[81] = new SingleByteCharSetProber(new Iso_8859_15_EstonianModel());
			probers[82] = new SingleByteCharSetProber(new Iso_8859_1_IrishModel());
			probers[83] = new SingleByteCharSetProber(new Iso_8859_9_IrishModel());
			probers[84] = new SingleByteCharSetProber(new Iso_8859_15_IrishModel());
			probers[85] = new SingleByteCharSetProber(new Windows_1252_IrishModel());
			probers[86] = new SingleByteCharSetProber(new Windows_1250_RomanianModel());
			probers[87] = new SingleByteCharSetProber(new Iso_8859_2_RomanianModel());
			probers[88] = new SingleByteCharSetProber(new Iso_8859_16_RomanianModel());
			probers[89] = new SingleByteCharSetProber(new Ibm852_RomanianModel());
			probers[90] = new SingleByteCharSetProber(new Windows_1250_SloveneModel());
			probers[91] = new SingleByteCharSetProber(new Iso_8859_2_SloveneModel());
			probers[92] = new SingleByteCharSetProber(new Iso_8859_16_SloveneModel());
			probers[93] = new SingleByteCharSetProber(new Mac_Centraleurope_SloveneModel());
			probers[94] = new SingleByteCharSetProber(new Ibm852_SloveneModel());
			probers[95] = new SingleByteCharSetProber(new Iso_8859_1_SwedishModel());
			probers[96] = new SingleByteCharSetProber(new Iso_8859_4_SwedishModel());
			probers[97] = new SingleByteCharSetProber(new Iso_8859_9_SwedishModel());
			probers[98] = new SingleByteCharSetProber(new Iso_8859_15_SwedishModel());
			probers[99] = new SingleByteCharSetProber(new Windows_1252_SwedishModel());
			Reset();
		}

		public override ProbingState HandleData(byte[] buf, int offset, int len)
		{
			byte[] array = CharsetProber.FilterWithoutEnglishLetters(buf, offset, len);
			if (array.Length == 0)
			{
				return state;
			}
			for (int i = 0; i < 100; i++)
			{
				if (!isActive[i])
				{
					continue;
				}
				switch (probers[i].HandleData(array, 0, array.Length))
				{
				case ProbingState.FoundIt:
					bestGuess = i;
					state = ProbingState.FoundIt;
					break;
				case ProbingState.NotMe:
					isActive[i] = false;
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
				for (int i = 0; i < 100; i++)
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
			stringBuilder.AppendLine(" SBCS Group Prober --------begin status");
			for (int i = 0; i < 100; i++)
			{
				if (probers[i] != null)
				{
					if (!isActive[i])
					{
						stringBuilder.AppendLine(" SBCS inactive: [" + probers[i].GetCharsetName() + "] (i.e. confidence is too low).");
						continue;
					}
					float confidence2 = probers[i].GetConfidence();
					stringBuilder.AppendLine($" SBCS {confidence2}: [{probers[i].GetCharsetName()}]");
					stringBuilder.AppendLine(probers[i].DumpStatus());
				}
			}
			stringBuilder.AppendLine($" SBCS Group found best match [{probers[bestGuess].GetCharsetName()}] confidence {confidence}.");
			return stringBuilder.ToString();
		}

		public override void Reset()
		{
			activeNum = 0;
			for (int i = 0; i < 100; i++)
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
	}
}
