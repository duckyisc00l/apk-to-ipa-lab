using System;

namespace CSharpSynth.Synthesis
{
	public static class SynthHelper
	{
		public enum WaveFormType
		{
			Sine = 0,
			Sawtooth = 1,
			Square = 2,
			Triangle = 3,
			WhiteNoise = 4
		}

		public const float DEFAULT_ATTACK = 0.001f;

		public const float DEFAULT_RELEASE = 0.001f;

		public const float DEFAULT_DECAY = 9999f;

		public const float DEFAULT_HOLD = 0.01f;

		public const int DEFAULT_SAMPLERATE = 44100;

		public const double STARTING_FREQUENCY = 8.1757989156;

		public const float DEFAULT_AMPLITUDE = 0.25f;

		private static Random rnd = new Random();

		public static double getRandom()
		{
			return rnd.NextDouble();
		}

		public static int getSampleFromTime(int sampleRate, float timeInSeconds)
		{
			return (int)((float)sampleRate * timeInSeconds);
		}

		public static float getTimeFromSample(int sampleRate, int Sample)
		{
			return (float)Sample / (float)sampleRate;
		}

		public static float Clamp(float value, float min, float max)
		{
			if (value < min)
			{
				return min;
			}
			if (value > max)
			{
				return max;
			}
			return value;
		}

		public static double Clamp(double value, double min, double max)
		{
			if (value < min)
			{
				return min;
			}
			if (value > max)
			{
				return max;
			}
			return value;
		}

		public static float Sine(double frequency, double time)
		{
			return (float)Math.Sin(frequency * time * 2.0 * Math.PI);
		}

		public static float Square(double frequency, double time)
		{
			if (!(Sine(frequency, time) >= 0f))
			{
				return -1f;
			}
			return 1f;
		}

		public static float Sawtooth(double frequency, double time)
		{
			return (float)(2.0 * (time * frequency - Math.Floor(time * frequency + 0.5)));
		}

		public static float Triangle(double frequency, double time)
		{
			return Math.Abs(Sawtooth(frequency, time)) * 2f - 1f;
		}

		public static float WhiteNoise(int note, double time)
		{
			return (float)(getRandom() - getRandom());
		}

		public static double NoteToFrequency(double note)
		{
			return Math.Pow(2.0, note / 12.0) * 8.1757989156;
		}

		public static WaveFormType getTypeFromString(string wavetype)
		{
			return wavetype.Trim().ToLower() switch
			{
				"sine" => WaveFormType.Sine, 
				"sawtooth" => WaveFormType.Sawtooth, 
				"square" => WaveFormType.Square, 
				"triangle" => WaveFormType.Triangle, 
				"whitenoise" => WaveFormType.WhiteNoise, 
				_ => WaveFormType.Square, 
			};
		}
	}
}
