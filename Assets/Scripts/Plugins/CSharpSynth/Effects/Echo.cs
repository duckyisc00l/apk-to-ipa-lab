using System;
using CSharpSynth.Synthesis;

namespace CSharpSynth.Effects
{
	public class Echo : BasicAudioEffect
	{
		private int channels;

		private int secondarybufferlen;

		private int secondaryposition;

		private float decay;

		public float Decay
		{
			get
			{
				return decay;
			}
			set
			{
				decay = SynthHelper.Clamp(value, 0f, 1f);
			}
		}

		public Echo(StreamSynthesizer synth, float delaytime, float decay)
		{
			if (delaytime <= 0f)
			{
				throw new ArgumentException("delay time must be positive non-zero for echo effect.");
			}
			this.decay = SynthHelper.Clamp(decay, 0f, 1f);
			base.EffectBuffer = new float[synth.Channels, SynthHelper.getSampleFromTime(synth.SampleRate, delaytime)];
			channels = base.EffectBuffer.GetLength(0);
			secondarybufferlen = base.EffectBuffer.GetLength(1);
		}

		public void resetEcho()
		{
			secondaryposition = 0;
			Array.Clear(base.EffectBuffer, 0, secondarybufferlen * channels);
		}

		public override void doEffect(float[,] inputBuffer)
		{
			int length = inputBuffer.GetLength(1);
			for (int i = 0; i < length; i++)
			{
				for (int j = 0; j < channels; j++)
				{
					float num = inputBuffer[j, i] + decay * base.EffectBuffer[j, secondaryposition];
					base.EffectBuffer[j, secondaryposition] = num;
					inputBuffer[j, i] = num;
				}
				secondaryposition++;
				if (secondaryposition == secondarybufferlen)
				{
					secondaryposition = 0;
				}
			}
		}
	}
}
