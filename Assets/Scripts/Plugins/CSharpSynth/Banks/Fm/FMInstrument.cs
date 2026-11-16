using System;
using System.Collections.Generic;
using System.IO;
using CSharpSynth.Synthesis;
using UnityEngine;

namespace CSharpSynth.Banks.Fm
{
	public class FMInstrument : Instrument
	{
		private class ModulatorFrequencyFunction : IFMComponent
		{
			private byte[] ops;

			private double[] values;

			public ModulatorFrequencyFunction(byte[] ops, double[] values)
			{
				if (ops.Length != values.Length)
				{
					throw new Exception("Invalid FM frequency function.");
				}
				this.ops = ops;
				this.values = values;
			}

			public double doProcess(double value)
			{
				for (int i = 0; i < ops.Length; i++)
				{
					switch (ops[i])
					{
					case 0:
						value *= values[i];
						break;
					case 1:
						value /= values[i];
						break;
					case 2:
						value += values[i];
						break;
					case 3:
						value -= values[i];
						break;
					}
				}
				return value;
			}
		}

		private class ModulatorAmplitudeFunction : IFMComponent
		{
			private byte[] ops;

			private double[] values;

			public ModulatorAmplitudeFunction(byte[] ops, double[] values)
			{
				if (ops.Length != values.Length)
				{
					throw new Exception("Invalid FM Amplitude function.");
				}
				this.ops = ops;
				this.values = values;
			}

			public double doProcess(double value)
			{
				for (int i = 0; i < ops.Length; i++)
				{
					switch (ops[i])
					{
					case 0:
						value *= values[i];
						break;
					case 1:
						value /= values[i];
						break;
					case 2:
						value += values[i];
						break;
					case 3:
						value -= values[i];
						break;
					}
				}
				return value;
			}
		}

		private SynthHelper.WaveFormType baseWaveType;

		private SynthHelper.WaveFormType modWaveType;

		private int _attack;

		private int _release;

		private int _decay;

		private int _hold;

		private double start_time;

		private double end_time;

		private bool looping;

		private Envelope env;

		private IFMComponent mamp;

		private IFMComponent mfreq;

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
				return baseWaveType;
			}
			set
			{
				baseWaveType = value;
			}
		}

		public FMInstrument(string fmProgramFile, int sampleRate)
		{
			base.SampleRate = sampleRate;
			_attack = SynthHelper.getSampleFromTime(sampleRate, 0.001f);
			_release = SynthHelper.getSampleFromTime(sampleRate, 0.001f);
			_decay = SynthHelper.getSampleFromTime(sampleRate, 9999f);
			_hold = SynthHelper.getSampleFromTime(sampleRate, 0.01f);
			loadProgramFile(fmProgramFile);
			base.Name = Path.GetFileNameWithoutExtension(fmProgramFile);
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
			if (time > end_time)
			{
				if (!looping)
				{
					time = end_time;
					return 0f;
				}
				time = start_time;
			}
			double num = SynthHelper.NoteToFrequency(note);
			switch (modWaveType)
			{
			case SynthHelper.WaveFormType.Sine:
				num += (double)SynthHelper.Sine(mfreq.doProcess(num), time) * mamp.doProcess(0.25);
				break;
			case SynthHelper.WaveFormType.Sawtooth:
				num += (double)SynthHelper.Sawtooth(mfreq.doProcess(num), time) * mamp.doProcess(0.25);
				break;
			case SynthHelper.WaveFormType.Square:
				num += (double)SynthHelper.Square(mfreq.doProcess(num), time) * mamp.doProcess(0.25);
				break;
			case SynthHelper.WaveFormType.Triangle:
				num += (double)SynthHelper.Triangle(mfreq.doProcess(num), time) * mamp.doProcess(0.25);
				break;
			case SynthHelper.WaveFormType.WhiteNoise:
				num += (double)SynthHelper.WhiteNoise(0, time) * mamp.doProcess(0.25);
				break;
			}
			return baseWaveType switch
			{
				SynthHelper.WaveFormType.Sine => SynthHelper.Sine(num, time) * env.doProcess(time), 
				SynthHelper.WaveFormType.Sawtooth => SynthHelper.Sawtooth(num, time) * env.doProcess(time), 
				SynthHelper.WaveFormType.Square => SynthHelper.Square(num, time) * env.doProcess(time), 
				SynthHelper.WaveFormType.Triangle => SynthHelper.Triangle(num, time) * env.doProcess(time), 
				SynthHelper.WaveFormType.WhiteNoise => SynthHelper.WhiteNoise(note, time) * env.doProcess(time), 
				_ => 0f, 
			};
		}

		private void loadProgramFile(string file)
		{
			StreamReader streamReader = new StreamReader(File.Open(Application.dataPath + "/Resources/" + file, FileMode.Open));
			if (!streamReader.ReadLine().Trim().ToUpper()
				.Equals("[FM INSTRUMENT]"))
			{
				streamReader.Dispose();
				throw new Exception("Invalid Program file: Incorrect Header!");
			}
			string[] array = streamReader.ReadLine().Split(new string[1] { "|" }, StringSplitOptions.None);
			if (array.Length < 4)
			{
				streamReader.Dispose();
				throw new Exception("Invalid Program file: Parameters are missing");
			}
			baseWaveType = SynthHelper.getTypeFromString(array[0]);
			modWaveType = SynthHelper.getTypeFromString(array[1]);
			mfreq = getOpsAndValues(array[2], isFrequencyFunction: true);
			mamp = getOpsAndValues(array[3], isFrequencyFunction: false);
			array = streamReader.ReadLine().Split(new string[1] { "|" }, StringSplitOptions.None);
			if (array.Length < 3)
			{
				streamReader.Dispose();
				throw new Exception("Invalid Program file: Parameters are missing");
			}
			if (int.Parse(array[0]) == 0)
			{
				looping = true;
			}
			start_time = double.Parse(array[1]);
			end_time = double.Parse(array[2]);
			array = streamReader.ReadLine().Split(new string[1] { "|" }, StringSplitOptions.None);
			if (array.Length < 3)
			{
				streamReader.Dispose();
				throw new Exception("Invalid Program file: Parameters are missing");
			}
			switch (array[0].ToLower().Trim())
			{
			case "fadein":
				env = Envelope.CreateBasicFadeIn(double.Parse(array[2]));
				break;
			case "fadeout":
				env = Envelope.CreateBasicFadeOut(double.Parse(array[2]));
				break;
			case "fadein&out":
			{
				double num = double.Parse(array[2]) / 2.0;
				env = Envelope.CreateBasicFadeInAndOut(num, num);
				break;
			}
			default:
				env = Envelope.CreateBasicConstant();
				break;
			}
			env.Peak = double.Parse(array[1]);
			streamReader.Dispose();
		}

		private IFMComponent getOpsAndValues(string arg, bool isFrequencyFunction)
		{
			arg += "    ";
			char[] array = arg.ToCharArray();
			List<byte> list = new List<byte>();
			List<double> list2 = new List<double>();
			string text = arg.Substring(0, 4).ToLower();
			if (isFrequencyFunction)
			{
				if (!text.Contains("freq"))
				{
					list.Add(0);
					list2.Add(0.0);
				}
			}
			else if (!text.Contains("amp"))
			{
				list.Add(0);
				list2.Add(0.0);
			}
			bool flag = false;
			bool flag2 = false;
			for (int i = 0; i < arg.Length; i++)
			{
				switch (array[i])
				{
				case '*':
					if (!flag)
					{
						list.Add(0);
						flag = true;
					}
					continue;
				case '/':
					if (!flag)
					{
						list.Add(1);
						flag = true;
					}
					continue;
				case '+':
					if (!flag)
					{
						list.Add(2);
						flag = true;
					}
					continue;
				case '-':
					if (flag)
					{
						flag2 = !flag2;
						continue;
					}
					list.Add(3);
					flag = true;
					continue;
				}
				string text2 = "";
				while (char.IsDigit(array[i]) || array[i] == '.')
				{
					text2 += array[i];
					i++;
					if (i >= array.Length)
					{
						break;
					}
				}
				if (text2.Length > 0)
				{
					i--;
					flag = false;
					if (flag2)
					{
						text2 = "-" + text2;
					}
					flag2 = false;
					list2.Add(double.Parse(text2));
				}
			}
			while (list.Count < list2.Count)
			{
				list.Add(2);
			}
			if (isFrequencyFunction)
			{
				return new ModulatorFrequencyFunction(list.ToArray(), list2.ToArray());
			}
			return new ModulatorAmplitudeFunction(list.ToArray(), list2.ToArray());
		}
	}
}
