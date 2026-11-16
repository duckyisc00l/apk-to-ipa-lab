using CSharpSynth.Synthesis;

namespace CSharpSynth.Banks.Analog
{
	public class AnalogInstrument : Instrument
	{
		private SynthHelper.WaveFormType type;

		private int _attack;

		private int _release;

		private int _decay;

		private int _hold;

		public int Attack
		{
			get
			{
				return _attack;
			}
			set
			{
				_attack = value;
			}
		}

		public int Release
		{
			get
			{
				return _release;
			}
			set
			{
				_release = value;
			}
		}

		public SynthHelper.WaveFormType WaveForm
		{
			get
			{
				return type;
			}
			set
			{
				type = value;
			}
		}

		public AnalogInstrument(SynthHelper.WaveFormType waveformtype, int sampleRate)
		{
			type = waveformtype;
			base.SampleRate = sampleRate;
			_attack = SynthHelper.getSampleFromTime(sampleRate, 0.001f);
			_release = SynthHelper.getSampleFromTime(sampleRate, 0.001f);
			_decay = SynthHelper.getSampleFromTime(sampleRate, 9999f);
			_hold = SynthHelper.getSampleFromTime(sampleRate, 0.01f);
			base.Name = waveformtype.ToString();
		}

		public override bool allSamplesSupportDualChannel()
		{
			return false;
		}

		public override void enforceSampleRate(int sampleRate)
		{
			if (sampleRate != base.SampleRate)
			{
				_attack = SynthHelper.getSampleFromTime(sampleRate, 0.001f);
				_release = SynthHelper.getSampleFromTime(sampleRate, 0.001f);
				_decay = SynthHelper.getSampleFromTime(sampleRate, 9999f);
				_hold = SynthHelper.getSampleFromTime(sampleRate, 0.01f);
				base.SampleRate = sampleRate;
			}
		}

		public override int getAttack(int note)
		{
			return _attack;
		}

		public override int getRelease(int note)
		{
			return _release;
		}

		public override int getDecay(int note)
		{
			return _decay;
		}

		public override int getHold(int note)
		{
			return _hold;
		}

		public override float getSampleAtTime(int note, int channel, int synthSampleRate, ref double time)
		{
			double num = SynthHelper.NoteToFrequency(note);
			if (num * time > 1.0)
			{
				time = 0.0;
			}
			return type switch
			{
				SynthHelper.WaveFormType.Sine => SynthHelper.Sine(num, time) * 0.25f, 
				SynthHelper.WaveFormType.Sawtooth => SynthHelper.Sawtooth(num, time) * 0.25f, 
				SynthHelper.WaveFormType.Square => SynthHelper.Square(num, time) * 0.25f, 
				SynthHelper.WaveFormType.Triangle => SynthHelper.Triangle(num, time) * 0.25f, 
				SynthHelper.WaveFormType.WhiteNoise => SynthHelper.WhiteNoise(note, time) * 0.25f, 
				_ => 0f, 
			};
		}
	}
}
