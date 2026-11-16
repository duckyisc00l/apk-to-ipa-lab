using System;
using System.Collections.Generic;
using System.IO;
using CSharpSynth.Banks.Analog;
using CSharpSynth.Banks.Fm;
using CSharpSynth.Banks.Sfz;
using CSharpSynth.Synthesis;
using CSharpSynth.Wave;
using UnityEngine;

namespace CSharpSynth.Banks
{
	public class InstrumentBank
	{
		private List<Instrument> Bank = new List<Instrument>();

		private List<Instrument> DrumBank = new List<Instrument>();

		private List<string> SampleName = new List<string>();

		private List<Sample> Samples = new List<Sample>();

		private string lastbankpath = "";

		private int SampleRate_;

		private int SampleMemUse;

		public static Sample nullSample = new Sample(44100);

		public int InstrumentCount => Bank.Count;

		public string BankPath
		{
			get
			{
				return lastbankpath;
			}
			set
			{
				lastbankpath = value;
			}
		}

		public static Sample DummySample => nullSample;

		public List<string> SampleNameList => SampleName;

		public List<Sample> SampleList => Samples;

		public int DrumCount => DrumBank.Count;

		public int MemoryUsage => SampleMemUse;

		public int SampleRate
		{
			get
			{
				return SampleRate_;
			}
			set
			{
				SampleRate_ = value;
			}
		}

		public InstrumentBank(int sampleRate, string bankfile)
		{
			SampleRate_ = sampleRate;
			loadBank(bankfile);
			reCalculateMemoryUsage();
		}

		public InstrumentBank(int sampleRate, string bankfile, byte[] Programs, byte[] DrumPrograms)
		{
			SampleRate_ = sampleRate;
			lastbankpath = bankfile;
			loadBank(Programs, DrumPrograms);
			reCalculateMemoryUsage();
		}

		public void loadBank(string bankfile)
		{
			Clear();
			Bank.Capacity = 256;
			DrumBank.Capacity = 128;
			for (int i = 0; i < 256; i++)
			{
				Bank.Add(null);
			}
			for (int j = 0; j < 128; j++)
			{
				DrumBank.Add(null);
			}
			Stream bankStream = new MemoryStream((Resources.Load(bankfile) as TextAsset).bytes);
			loadStream(bankStream, Path.GetDirectoryName(bankfile) + "/", null, null);
			lastbankpath = bankfile;
		}

		public void loadBank(byte[] Programs, byte[] DrumPrograms)
		{
			if (File.Exists(lastbankpath))
			{
				Clear();
				Bank.Capacity = 256;
				DrumBank.Capacity = 128;
				for (int i = 0; i < 256; i++)
				{
					Bank.Add(null);
				}
				for (int j = 0; j < 128; j++)
				{
					DrumBank.Add(null);
				}
				Stream bankStream = new MemoryStream((Resources.Load(lastbankpath) as TextAsset).bytes);
				loadStream(bankStream, Path.GetDirectoryName(lastbankpath) + "/", Programs, DrumPrograms);
			}
		}

		public void loadStream(Stream bankStream, string directory, byte[] Programs, byte[] DrumPrograms)
		{
			StreamReader streamReader = new StreamReader(bankStream);
			List<string> list = new List<string>();
			while (streamReader.Peek() > -1)
			{
				list.Add(streamReader.ReadLine());
			}
			streamReader.Dispose();
			bankStream.Dispose();
			if (list[0].Trim() != "[BankFile]")
			{
				throw new Exception("Not a valid BankFile!");
			}
			for (int i = 1; i < list.Count; i++)
			{
				string[] array = list[i].Split(new string[1] { "/" }, StringSplitOptions.None);
				switch (array[1].Trim().ToLower())
				{
				case "analog":
					loadAnalog(array, Programs, DrumPrograms);
					break;
				case "fm":
					loadFm(array, directory, Programs, DrumPrograms);
					break;
				case "sfz":
					loadSfz(array, directory, Programs, DrumPrograms);
					break;
				}
			}
		}

		public void addInstrument(Instrument inst, bool isDrum)
		{
			if (!isDrum)
			{
				if (!Bank.Contains(inst))
				{
					if (SampleRate_ > 0)
					{
						inst.enforceSampleRate(SampleRate_);
					}
					if (inst.SampleList != null)
					{
						for (int i = 0; i < inst.SampleList.Length; i++)
						{
							if (!SampleName.Contains(inst.SampleList[i].Name))
							{
								SampleMemUse += inst.SampleList[i].getMemoryUseage();
								SampleName.Add(inst.SampleList[i].Name);
								Samples.Add(inst.SampleList[i]);
							}
						}
					}
				}
				Bank.Add(inst);
				return;
			}
			if (!DrumBank.Contains(inst))
			{
				if (SampleRate_ > 0)
				{
					inst.enforceSampleRate(SampleRate_);
				}
				if (inst.SampleList != null)
				{
					for (int j = 0; j < inst.SampleList.Length; j++)
					{
						SampleMemUse += inst.SampleList[j].getMemoryUseage();
						if (!SampleName.Contains(inst.SampleList[j].Name))
						{
							SampleName.Add(inst.SampleList[j].Name);
							Samples.Add(inst.SampleList[j]);
						}
					}
				}
			}
			DrumBank.Add(inst);
		}

		public Instrument getInstrument(int index, bool isDrum)
		{
			if (!isDrum)
			{
				return Bank[index];
			}
			return DrumBank[index];
		}

		public List<Instrument> getInstruments(bool isDrum)
		{
			if (!isDrum)
			{
				return Bank;
			}
			return DrumBank;
		}

		public void removeInstrument(int index, bool isDrum)
		{
			if (isDrum)
			{
				DrumBank[index] = null;
			}
			else
			{
				Bank[index] = null;
			}
		}

		public void deleteUnusedSamples()
		{
			Samples.Clear();
			SampleName.Clear();
			for (int i = 0; i < Bank.Count; i++)
			{
				if (Bank[i] == null)
				{
					continue;
				}
				Sample[] sampleList = Bank[i].SampleList;
				for (int j = 0; j < sampleList.Length; j++)
				{
					if (!SampleName.Contains(sampleList[j].Name))
					{
						SampleName.Add(sampleList[j].Name);
						Samples.Add(sampleList[j]);
					}
				}
			}
			for (int k = 0; k < DrumBank.Count; k++)
			{
				if (DrumBank[k] == null)
				{
					continue;
				}
				Sample[] sampleList2 = DrumBank[k].SampleList;
				for (int l = 0; l < sampleList2.Length; l++)
				{
					if (!SampleName.Contains(sampleList2[l].Name))
					{
						SampleName.Add(sampleList2[l].Name);
						Samples.Add(sampleList2[l]);
					}
				}
			}
			reCalculateMemoryUsage();
		}

		public void Clear()
		{
			Bank.Clear();
			DrumBank.Clear();
			SampleName.Clear();
			Samples.Clear();
			SampleMemUse = 0;
		}

		private void loadAnalog(string[] args, byte[] Programs, byte[] DrumPrograms)
		{
			bool flag = args[4] == "d";
			int num = int.Parse(args[2]);
			int num2 = int.Parse(args[3]);
			List<int> list = new List<int>();
			if (!flag)
			{
				if (Programs == null)
				{
					for (int i = num; i <= num2; i++)
					{
						list.Add(i);
					}
				}
				else
				{
					for (int j = 0; j < Programs.Length; j++)
					{
						if (Programs[j] >= num && Programs[j] <= num2)
						{
							list.Add(Programs[j]);
						}
					}
				}
			}
			else if (DrumPrograms == null)
			{
				for (int k = num; k <= num2; k++)
				{
					list.Add(k);
				}
			}
			else
			{
				for (int l = 0; l < DrumPrograms.Length; l++)
				{
					if (DrumPrograms[l] >= num && Programs[l] <= num2)
					{
						list.Add(DrumPrograms[l]);
					}
				}
			}
			if (list.Count <= 0)
			{
				return;
			}
			Instrument instrument = new AnalogInstrument(SynthHelper.getTypeFromString(args[0]), SampleRate_);
			if (SampleRate_ > 0)
			{
				instrument.enforceSampleRate(SampleRate_);
			}
			for (int m = 0; m < list.Count; m++)
			{
				if (flag)
				{
					DrumBank[list[m]] = instrument;
				}
				else
				{
					Bank[list[m]] = instrument;
				}
			}
		}

		private void loadFm(string[] args, string bankpath, byte[] Programs, byte[] DrumPrograms)
		{
			bool flag = args[4] == "d";
			int num = int.Parse(args[2]);
			int num2 = int.Parse(args[3]);
			List<int> list = new List<int>();
			if (!flag)
			{
				if (Programs == null)
				{
					for (int i = num; i <= num2; i++)
					{
						list.Add(i);
					}
				}
				else
				{
					for (int j = 0; j < Programs.Length; j++)
					{
						if (Programs[j] >= num && Programs[j] <= num2)
						{
							list.Add(Programs[j]);
						}
					}
				}
			}
			else if (DrumPrograms == null)
			{
				for (int k = num; k <= num2; k++)
				{
					list.Add(k);
				}
			}
			else
			{
				for (int l = 0; l < DrumPrograms.Length; l++)
				{
					if (DrumPrograms[l] >= num && Programs[l] <= num2)
					{
						list.Add(DrumPrograms[l]);
					}
				}
			}
			if (list.Count <= 0)
			{
				return;
			}
			Instrument instrument = new FMInstrument(bankpath + args[0] + ".prg", SampleRate_);
			if (SampleRate_ > 0)
			{
				instrument.enforceSampleRate(SampleRate_);
			}
			for (int m = 0; m < list.Count; m++)
			{
				if (flag)
				{
					DrumBank[list[m]] = instrument;
				}
				else
				{
					Bank[list[m]] = instrument;
				}
			}
		}

		private void loadSfz(string[] args, string bankpath, byte[] Programs, byte[] DrumPrograms)
		{
			bool flag = args[4] == "d";
			int num = int.Parse(args[2]);
			int num2 = int.Parse(args[3]);
			List<int> list = new List<int>();
			if (!flag)
			{
				if (Programs == null)
				{
					for (int i = num; i <= num2; i++)
					{
						list.Add(i);
					}
				}
				else
				{
					for (int j = 0; j < Programs.Length; j++)
					{
						if (Programs[j] >= num && Programs[j] <= num2)
						{
							list.Add(Programs[j]);
						}
					}
				}
			}
			else if (DrumPrograms == null)
			{
				for (int k = num; k <= num2; k++)
				{
					list.Add(k);
				}
			}
			else
			{
				for (int l = 0; l < DrumPrograms.Length; l++)
				{
					if (DrumPrograms[l] >= num && Programs[l] <= num2)
					{
						list.Add(DrumPrograms[l]);
					}
				}
			}
			if (list.Count <= 0)
			{
				return;
			}
			Instrument instrument = new SfzInstrument(bankpath + args[0] + ".sfz", SampleRate_, this);
			if (SampleRate_ > 0)
			{
				instrument.enforceSampleRate(SampleRate_);
			}
			for (int m = 0; m < list.Count; m++)
			{
				if (flag)
				{
					DrumBank[list[m]] = instrument;
				}
				else
				{
					Bank[list[m]] = instrument;
				}
			}
		}

		private void reCalculateMemoryUsage()
		{
			SampleMemUse = 0;
			for (int i = 0; i < Samples.Count; i++)
			{
				SampleMemUse += Samples[i].getMemoryUseage();
			}
		}
	}
}
