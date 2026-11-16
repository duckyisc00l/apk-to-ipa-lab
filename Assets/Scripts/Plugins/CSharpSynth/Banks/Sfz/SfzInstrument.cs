using System;
using System.Collections.Generic;
using System.Globalization;
using System.IO;
using CSharpSynth.Synthesis;
using CSharpSynth.Wave;
using UnityEngine;

namespace CSharpSynth.Banks.Sfz
{
	public class SfzInstrument : Instrument
	{
		private SfzRegion[] regions;

		private byte[] noteMap;

		private bool allSamplesHaveDualChannels;

		public SfzInstrument(string Instrumentfile, int sampleRate, InstrumentBank bank)
		{
			base.SampleRate = sampleRate;
			Stream instrumentStream = new MemoryStream((Resources.Load(Instrumentfile) as TextAsset).bytes);
			ReadFromStream(instrumentStream, Path.GetDirectoryName(Instrumentfile) + "/", bank);
			CreateKeyMap();
			base.Name = Path.GetFileNameWithoutExtension(Instrumentfile);
		}

		public override bool allSamplesSupportDualChannel()
		{
			return allSamplesHaveDualChannels;
		}

		public override int getAttack(int note)
		{
			return regions[noteMap[note]].Attack;
		}

		public override int getRelease(int note)
		{
			return regions[noteMap[note]].Release;
		}

		public override int getDecay(int note)
		{
			return regions[noteMap[note]].Decay;
		}

		public override int getHold(int note)
		{
			return regions[noteMap[note]].Hold;
		}

		public override void enforceSampleRate(int sampleRate)
		{
			if (sampleRate == base.SampleRate)
			{
				return;
			}
			for (int i = 0; i < regions.Length; i++)
			{
				_ = base.SampleList[regions[i].SampleIndex];
				float num = sampleRate / base.SampleRate;
				regions[i].LoopEnd = (int)((float)regions[i].LoopEnd * num);
				regions[i].LoopStart = (int)((float)regions[i].LoopStart * num);
				regions[i].Offset = (int)((float)regions[i].Offset * num);
				regions[i].Attack = (int)((float)regions[i].Attack * num);
				regions[i].Release = (int)((float)regions[i].Release * num);
				regions[i].Decay = (int)((float)regions[i].Decay * num);
				regions[i].Hold = (int)((float)regions[i].Hold * num);
			}
			for (int j = 0; j < base.SampleList.Length; j++)
			{
				Sample sample = base.SampleList[j];
				if ((float)sampleRate / (float)sample.SampleRate != 1f)
				{
					sample.setAllSampleData(WaveHelper.ReSample(sampleRate, sample.SampleRate, sample.getAllSampleData()));
					sample.SampleRate = sampleRate;
				}
			}
			base.SampleRate = sampleRate;
		}

		public override float getSampleAtTime(int note, int channel, int synthSampleRate, ref double time)
		{
			int num = synthSampleRate;
			SfzRegion sfzRegion = regions[noteMap[note]];
			Sample sample = base.SampleList[sfzRegion.SampleIndex];
			synthSampleRate = (int)((double)synthSampleRate * Math.Pow(2.0, (double)((float)(note - sfzRegion.Root) + sfzRegion.Tune) / 12.0));
			int num2 = (int)(time / (1.0 / (double)synthSampleRate));
			if (num2 > sfzRegion.LoopEnd)
			{
				if (sfzRegion.LoopMode == 0)
				{
					time -= 1.0 / (double)num;
					return 0f;
				}
				num2 = sfzRegion.LoopStart;
				time = (double)sfzRegion.LoopStart * (1.0 / (double)synthSampleRate);
			}
			return sample.getSample(channel, num2);
		}

		private void ReadFromStream(Stream InstrumentStream, string path, InstrumentBank bank)
		{
			StreamReader streamReader = new StreamReader(InstrumentStream);
			List<string> list = new List<string>();
			while (streamReader.Peek() > -1)
			{
				list.Add(streamReader.ReadLine());
			}
			streamReader.Dispose();
			InstrumentStream.Dispose();
			ParseInstrumentData(list.ToArray(), path, bank);
		}

		private void ParseInstrumentData(string[] text, string InstrumentPath, InstrumentBank bank)
		{
			allSamplesHaveDualChannels = true;
			SfzRegion sfzRegion = new SfzRegion();
			bool[] array = new bool[21];
			List<Sample> list = new List<Sample>();
			List<string> list2 = new List<string>();
			List<SfzRegion> list3 = new List<SfzRegion>();
			for (int i = 0; i < text.Length; i++)
			{
				string text2 = text[i].Trim();
				if (!(text2 != "") || !(text2.Substring(0, 1).ToLower() == "<"))
				{
					continue;
				}
				if (text2 == "<group>")
				{
					while (text[i] != "")
					{
						i++;
						if (i >= text.Length)
						{
							break;
						}
						string[] array2 = text[i].Split(new string[1] { "=" }, StringSplitOptions.RemoveEmptyEntries);
						if (array2.Length != 2)
						{
							continue;
						}
						switch (array2[0])
						{
						case "sample":
						{
							array2[1] = Path.GetFileNameWithoutExtension(array2[1]);
							array[0] = true;
							if (list2.Contains(array2[1]))
							{
								sfzRegion.SampleIndex = list2.IndexOf(array2[1]);
								break;
							}
							list2.Add(array2[1]);
							int num = bank.SampleNameList.IndexOf(array2[1]);
							Sample sample;
							if (num > -1)
							{
								sample = bank.SampleList[num];
							}
							else
							{
								sample = new Sample(InstrumentPath + "SAMPLES/" + array2[1] + ".wav");
								bank.SampleList.Add(sample);
								bank.SampleNameList.Add(array2[1]);
							}
							if (!sample.isDualChannel)
							{
								allSamplesHaveDualChannels = false;
							}
							list.Add(sample);
							sfzRegion.SampleIndex = list2.Count - 1;
							break;
						}
						case "hikey":
							sfzRegion.HiNote = (byte)int.Parse(array2[1]);
							array[1] = true;
							break;
						case "lokey":
							sfzRegion.LoNote = (byte)int.Parse(array2[1]);
							array[2] = true;
							break;
						case "loop_start":
							sfzRegion.LoopStart = int.Parse(array2[1]);
							array[3] = true;
							break;
						case "loop_end":
							sfzRegion.LoopEnd = int.Parse(array2[1]);
							array[4] = true;
							break;
						case "tune":
							sfzRegion.Tune = (float)int.Parse(array2[1]) / 100f;
							array[5] = true;
							break;
						case "pitch_keycenter":
							sfzRegion.Root = int.Parse(array2[1]);
							array[6] = true;
							break;
						case "volume":
							sfzRegion.Volume = float.Parse(array2[1], CultureInfo.InvariantCulture);
							array[7] = true;
							break;
						case "loop_mode":
						{
							array[8] = true;
							string text3 = array2[1];
							if (!(text3 == "loop_continuous"))
							{
								if (text3 == "loop_sustain")
								{
									sfzRegion.LoopMode = 2;
								}
								else
								{
									sfzRegion.LoopMode = 0;
								}
							}
							else
							{
								sfzRegion.LoopMode = 1;
							}
							break;
						}
						case "ampeg_release":
							array[9] = true;
							sfzRegion.Release = SynthHelper.getSampleFromTime(base.SampleRate, float.Parse(array2[1], CultureInfo.InvariantCulture));
							break;
						case "ampeg_attack":
							array[10] = true;
							sfzRegion.Attack = SynthHelper.getSampleFromTime(base.SampleRate, float.Parse(array2[1], CultureInfo.InvariantCulture));
							break;
						case "ampeg_decay":
							array[11] = true;
							sfzRegion.Decay = SynthHelper.getSampleFromTime(base.SampleRate, float.Parse(array2[1], CultureInfo.InvariantCulture));
							break;
						case "ampeg_hold":
							array[12] = true;
							sfzRegion.Hold = SynthHelper.getSampleFromTime(base.SampleRate, float.Parse(array2[1], CultureInfo.InvariantCulture));
							break;
						case "lovel":
							array[13] = true;
							sfzRegion.LoVelocity = (byte)int.Parse(array2[1]);
							break;
						case "hivel":
							array[14] = true;
							sfzRegion.HiVelocity = (byte)int.Parse(array2[1]);
							break;
						case "lochan":
							array[15] = true;
							sfzRegion.LoChannel = (byte)(int.Parse(array2[1]) - 1);
							break;
						case "hichan":
							array[16] = true;
							sfzRegion.HiChannel = (byte)(int.Parse(array2[1]) - 1);
							break;
						case "key":
							sfzRegion.Root = int.Parse(array2[1]);
							array[6] = true;
							sfzRegion.HiNote = (byte)sfzRegion.Root;
							array[1] = true;
							sfzRegion.LoNote = (byte)sfzRegion.Root;
							array[2] = true;
							break;
						case "offset":
							array[17] = true;
							sfzRegion.Offset = int.Parse(array2[1]);
							break;
						case "pan":
							array[18] = true;
							sfzRegion.Pan = float.Parse(array2[1]);
							break;
						case "effect1":
							array[19] = true;
							sfzRegion.Effect1 = float.Parse(array2[1]);
							break;
						case "effect2":
							array[20] = true;
							sfzRegion.Effect2 = float.Parse(array2[1]);
							break;
						}
					}
				}
				else
				{
					if (!(text2 == "<region>"))
					{
						continue;
					}
					SfzRegion sfzRegion2 = new SfzRegion();
					while (text[i] != "")
					{
						i++;
						if (i >= text.Length)
						{
							break;
						}
						string[] array3 = text[i].Split(new string[1] { "=" }, StringSplitOptions.RemoveEmptyEntries);
						if (array3.Length != 2)
						{
							continue;
						}
						switch (array3[0])
						{
						case "sample":
						{
							array3[1] = Path.GetFileNameWithoutExtension(array3[1]);
							if (list2.Contains(array3[1]))
							{
								sfzRegion2.SampleIndex = list2.IndexOf(array3[1]);
								break;
							}
							list2.Add(array3[1]);
							int num2 = bank.SampleNameList.IndexOf(array3[1]);
							Sample sample2;
							if (num2 > -1)
							{
								sample2 = bank.SampleList[num2];
							}
							else
							{
								sample2 = new Sample(InstrumentPath + "SAMPLES/" + array3[1] + ".wav");
								bank.SampleList.Add(sample2);
								bank.SampleNameList.Add(array3[1]);
							}
							if (!sample2.isDualChannel)
							{
								allSamplesHaveDualChannels = false;
							}
							list.Add(sample2);
							sfzRegion2.SampleIndex = list2.Count - 1;
							break;
						}
						case "hikey":
							sfzRegion2.HiNote = (byte)int.Parse(array3[1]);
							break;
						case "lokey":
							sfzRegion2.LoNote = (byte)int.Parse(array3[1]);
							break;
						case "loop_start":
							sfzRegion2.LoopStart = int.Parse(array3[1]);
							break;
						case "loop_end":
							sfzRegion2.LoopEnd = int.Parse(array3[1]);
							break;
						case "tune":
							sfzRegion2.Tune = (float)int.Parse(array3[1]) / 100f;
							break;
						case "pitch_keycenter":
							sfzRegion2.Root = int.Parse(array3[1]);
							break;
						case "volume":
							sfzRegion2.Volume = float.Parse(array3[1], CultureInfo.InvariantCulture);
							break;
						case "loop_mode":
						{
							string text3 = array3[1];
							if (!(text3 == "loop_continuous"))
							{
								if (text3 == "loop_sustain")
								{
									sfzRegion2.LoopMode = 2;
								}
								else
								{
									sfzRegion2.LoopMode = 0;
								}
							}
							else
							{
								sfzRegion2.LoopMode = 1;
							}
							break;
						}
						case "ampeg_release":
							sfzRegion2.Release = SynthHelper.getSampleFromTime(base.SampleRate, float.Parse(array3[1], CultureInfo.InvariantCulture));
							break;
						case "ampeg_attack":
							sfzRegion2.Attack = SynthHelper.getSampleFromTime(base.SampleRate, float.Parse(array3[1], CultureInfo.InvariantCulture));
							break;
						case "ampeg_decay":
							sfzRegion2.Decay = SynthHelper.getSampleFromTime(base.SampleRate, float.Parse(array3[1], CultureInfo.InvariantCulture));
							break;
						case "ampeg_hold":
							sfzRegion2.Hold = SynthHelper.getSampleFromTime(base.SampleRate, float.Parse(array3[1], CultureInfo.InvariantCulture));
							break;
						case "lovel":
							sfzRegion2.LoVelocity = (byte)int.Parse(array3[1]);
							break;
						case "hivel":
							sfzRegion2.HiVelocity = (byte)int.Parse(array3[1]);
							break;
						case "lochan":
							sfzRegion2.LoChannel = (byte)(int.Parse(array3[1]) - 1);
							break;
						case "hichan":
							sfzRegion2.HiChannel = (byte)(int.Parse(array3[1]) - 1);
							break;
						case "key":
							sfzRegion2.Root = int.Parse(array3[1]);
							sfzRegion2.HiNote = (byte)sfzRegion2.Root;
							sfzRegion2.LoNote = (byte)sfzRegion2.Root;
							break;
						case "offset":
							sfzRegion2.Offset = int.Parse(array3[1]);
							break;
						case "pan":
							sfzRegion2.Pan = float.Parse(array3[1]);
							break;
						case "effect1":
							sfzRegion2.Effect1 = float.Parse(array3[1]);
							break;
						case "effect2":
							sfzRegion2.Effect2 = float.Parse(array3[1]);
							break;
						}
					}
					if (!list3.Contains(sfzRegion2))
					{
						list3.Add(sfzRegion2);
					}
				}
			}
			for (int j = 0; j < list3.Count; j++)
			{
				if (array[0])
				{
					list3[j].SampleIndex = sfzRegion.SampleIndex;
				}
				if (array[1])
				{
					list3[j].HiNote = sfzRegion.HiNote;
				}
				if (array[2])
				{
					list3[j].LoNote = sfzRegion.LoNote;
				}
				if (array[3])
				{
					list3[j].LoopStart = sfzRegion.LoopStart;
				}
				if (array[4])
				{
					list3[j].LoopEnd = sfzRegion.LoopEnd;
				}
				if (array[5])
				{
					list3[j].Tune = sfzRegion.Tune;
				}
				if (array[6])
				{
					list3[j].Root = sfzRegion.Root;
				}
				if (array[7])
				{
					list3[j].Volume = sfzRegion.Volume;
				}
				if (array[8])
				{
					list3[j].LoopMode = sfzRegion.LoopMode;
				}
				if (array[9])
				{
					list3[j].Release = sfzRegion.Release;
				}
				if (array[10])
				{
					list3[j].Attack = sfzRegion.Attack;
				}
				if (array[11])
				{
					list3[j].Decay = sfzRegion.Decay;
				}
				if (array[12])
				{
					list3[j].Hold = sfzRegion.Hold;
				}
				if (array[13])
				{
					list3[j].LoVelocity = sfzRegion.LoVelocity;
				}
				if (array[14])
				{
					list3[j].HiVelocity = sfzRegion.HiVelocity;
				}
				if (array[15])
				{
					list3[j].LoChannel = sfzRegion.LoChannel;
				}
				if (array[16])
				{
					list3[j].HiChannel = sfzRegion.HiChannel;
				}
				if (array[17])
				{
					list3[j].Offset = sfzRegion.Offset;
				}
				if (array[18])
				{
					list3[j].Pan = sfzRegion.Pan;
				}
				if (array[19])
				{
					list3[j].Effect1 = sfzRegion.Effect1;
				}
				if (array[20])
				{
					list3[j].Effect2 = sfzRegion.Effect2;
				}
			}
			base.SampleList = list.ToArray();
			regions = list3.ToArray();
			for (int k = 0; k < regions.Length; k++)
			{
				Sample sample3 = base.SampleList[regions[k].SampleIndex];
				float num3 = (float)base.SampleRate / (float)sample3.OriginalSampleRate;
				regions[k].LoopEnd = (int)((float)regions[k].LoopEnd * num3);
				regions[k].LoopStart = (int)((float)regions[k].LoopStart * num3);
				regions[k].Offset = (int)((float)regions[k].Offset * num3);
				if (regions[k].LoopEnd <= 0)
				{
					if (base.SampleRate != sample3.SampleRate)
					{
						regions[k].LoopEnd = (int)((float)base.SampleList[regions[k].SampleIndex].SamplesPerChannel * num3) - 1;
					}
					else
					{
						regions[k].LoopEnd = base.SampleList[regions[k].SampleIndex].SamplesPerChannel - 1;
					}
				}
			}
			for (int l = 0; l < base.SampleList.Length; l++)
			{
				Sample sample4 = base.SampleList[l];
				if ((float)base.SampleRate / (float)sample4.SampleRate != 1f)
				{
					sample4.setAllSampleData(WaveHelper.ReSample(base.SampleRate, sample4.SampleRate, sample4.getAllSampleData()));
					sample4.SampleRate = base.SampleRate;
				}
			}
		}

		private void CreateKeyMap()
		{
			noteMap = new byte[255];
			for (int i = 0; i < regions.Length; i++)
			{
				for (int j = regions[i].LoNote; j < regions[i].HiNote + 1; j++)
				{
					noteMap[j] = (byte)i;
				}
			}
		}
	}
}
