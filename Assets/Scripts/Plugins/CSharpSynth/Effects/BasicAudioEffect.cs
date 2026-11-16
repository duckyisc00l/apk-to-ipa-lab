namespace CSharpSynth.Effects
{
	public abstract class BasicAudioEffect
	{
		private float[,] effectBuffer;

		public float[,] EffectBuffer
		{
			get
			{
				return effectBuffer;
			}
			set
			{
				effectBuffer = value;
			}
		}

		public BasicAudioEffect()
		{
		}

		public abstract void doEffect(float[,] inputBuffer);

		public static void Average(float[,] buffer)
		{
			for (int i = 0; i < buffer.GetLength(0); i++)
			{
				int num = buffer.GetLength(1) - 1;
				float num2 = (buffer[i, 0] + buffer[i, 1]) / 2f;
				float num3 = (buffer[i, num] + buffer[i, num - 1]) / 2f;
				for (int j = 1; j < num; j++)
				{
					buffer[i, j] = (buffer[i, j - 1] + buffer[i, j] + buffer[i, j + 1]) / 3f;
				}
				buffer[i, 0] = num2;
				buffer[i, num] = num3;
			}
		}

		public static void Gate(float[,] buffer, float lowerLimit, float higherLimit)
		{
			for (int i = 0; i < buffer.GetLength(0); i++)
			{
				int length = buffer.GetLength(1);
				for (int j = 0; j < length; j++)
				{
					if (buffer[i, j] < lowerLimit || buffer[i, j] > higherLimit)
					{
						buffer[i, j] = 0f;
					}
				}
			}
		}
	}
}
