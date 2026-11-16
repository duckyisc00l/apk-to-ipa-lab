namespace UtfUnknown.Core.Models
{
	public abstract class SequenceModel
	{
		public const byte ILL = byte.MaxValue;

		public const byte CTR = 254;

		public const byte SYM = 253;

		public const byte RET = 252;

		public const byte NUM = 251;

		protected byte[] charToOrderMap;

		protected byte[] precedenceMatrix;

		protected int freqCharCount;

		protected float typicalPositiveRatio;

		protected bool keepEnglishLetter;

		protected string charsetName;

		public int FreqCharCount => freqCharCount;

		public float TypicalPositiveRatio => typicalPositiveRatio;

		public bool KeepEnglishLetter => keepEnglishLetter;

		public string CharsetName => charsetName;

		public SequenceModel(byte[] charToOrderMap, byte[] precedenceMatrix, int freqCharCount, float typicalPositiveRatio, bool keepEnglishLetter, string charsetName)
		{
			this.charToOrderMap = charToOrderMap;
			this.precedenceMatrix = precedenceMatrix;
			this.freqCharCount = freqCharCount;
			this.typicalPositiveRatio = typicalPositiveRatio;
			this.keepEnglishLetter = keepEnglishLetter;
			this.charsetName = charsetName;
		}

		public byte GetOrder(byte b)
		{
			return charToOrderMap[b];
		}

		public byte GetPrecedence(int pos)
		{
			return precedenceMatrix[pos];
		}
	}
}
