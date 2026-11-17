using System;
using System.Collections.Generic;
using CSharpSynth.Banks;
using CSharpSynth.Effects;
using CSharpSynth.Sequencer;
using UnityEngine;

namespace CSharpSynth.Synthesis
{
	public class StreamSynthesizer
	{
		private InstrumentBank bank;

		private float[,] sampleBuffer;

		private int rawBufferLength;

		private Voice[] voicePool;

		private LinkedList<Voice> activeVoices;

		private Stack<Voice> freeVoices;

		private Dictionary<NoteRegistryKey, List<Voice>> keyRegistry;

		private float[] panPositions_;

		private float[] volPositions_;

		private double[] tunePositions_;

		private MidiSequencer seq;

		private List<BasicAudioEffect> effects;

		private int audioChannels = 1;

		private int sampleRate = 44100;

		private int samplesperBuffer = 2000;

		private int polyphony = 40;

		private int maxnotepoly = 2;

		private int bytesPerSample = 2;

		private float MainVolume = 1f;

		public int BufferSize => rawBufferLength;

		public float[] PanPositions => panPositions_;

		public float[] VolPositions => volPositions_;

		public double[] TunePositions => tunePositions_;

		public int MaxPolyPerNote
		{
			get
			{
				return maxnotepoly;
			}
			set
			{
				maxnotepoly = value;
			}
		}

		public float MasterVolume
		{
			get
			{
				return MainVolume;
			}
			set
			{
				MainVolume = SynthHelper.Clamp(value, 0f, 1f);
			}
		}

		public int SampleRate => sampleRate;

		public int Channels => audioChannels;

		public InstrumentBank SoundBank => bank;

		public StreamSynthesizer(int sampleRate, int audioChannels, int bufferSize, int maxpoly, int bytesPerSample)
		{
			this.sampleRate = sampleRate;
			this.audioChannels = audioChannels;
			this.bytesPerSample = bytesPerSample;
			samplesperBuffer = bufferSize;
			polyphony = maxpoly;
			setupSynth();
		}

		public bool LoadBank(string filename)
		{
			BankManager.addBank(new InstrumentBank(sampleRate, filename));
			SwitchBank(BankManager.Count - 1);
			return true;
		}

		public bool UnloadBank(int index)
		{
			if (index < BankManager.Count)
			{
				if (BankManager.Banks[index] == bank)
				{
					bank = null;
				}
				BankManager.removeBank(index);
				return true;
			}
			return false;
		}

		public bool UnloadBank()
		{
			if (bank != null)
			{
				BankManager.removeBank(bank);
				return true;
			}
			return false;
		}

		public void SwitchBank(int index)
		{
			if (index < BankManager.Count)
			{
				bank = BankManager.getBank(index);
			}
		}

		public void setPan(int channel, float position)
		{
			if (channel > -1 && channel < panPositions_.Length && position >= -1f && position <= 1f)
			{
				panPositions_[channel] = position;
			}
		}

		public void setVolume(int channel, float position)
		{
			if (channel > -1 && channel < volPositions_.Length && position >= 0f && position <= 1f)
			{
				volPositions_[channel] = position;
			}
		}

		public void setPitchBend(int channel, float semitones)
		{
			if (channel > -1 && channel < tunePositions_.Length && semitones >= -12f && semitones <= 12f)
			{
				tunePositions_[channel] = semitones;
			}
		}

		public void setSequencer(MidiSequencer sequencer)
		{
			seq = sequencer;
		}

		public void resetSynthControls()
		{
			Array.Clear(panPositions_, 0, panPositions_.Length);
			Array.Clear(tunePositions_, 0, tunePositions_.Length);
			for (int i = 0; i < volPositions_.Length; i++)
			{
				volPositions_[i] = 1f;
			}
		}

		public void Dispose()
		{
			Stop();
			sampleBuffer = null;
			voicePool = null;
			activeVoices.Clear();
			freeVoices.Clear();
			keyRegistry.Clear();
			effects.Clear();
		}

		public void Stop()
		{
			NoteOffAll(immediate: true);
		}

		public void NoteOn(int channel, int note, int velocity, int program)
		{
			Voice voice = getFreeVoice();
			if (voice == null)
			{
				voice = getUsedVoice(activeVoices.First.Value.getKey());
				if (voice == null)
				{
					return;
				}
			}
			NoteRegistryKey key = new NoteRegistryKey((byte)channel, (byte)note);
			if (channel == 9)
			{
				voice.setInstrument(bank.getInstrument(program, isDrum: true));
			}
			else
			{
				voice.setInstrument(bank.getInstrument(program, isDrum: false));
			}
			if (keyRegistry.ContainsKey(key))
			{
				if (keyRegistry[key].Count >= maxnotepoly)
				{
					keyRegistry[key][0].Stop();
					keyRegistry[key].RemoveAt(0);
				}
				keyRegistry[key].Add(voice);
			}
			else
			{
				List<Voice> list = new List<Voice>(maxnotepoly);
				list.Add(voice);
				keyRegistry.Add(key, list);
			}
			voice.Start(channel, note, velocity);
			activeVoices.AddLast(voice);
		}

		public void NoteOff(int channel, int note)
		{
			NoteRegistryKey key = new NoteRegistryKey((byte)channel, (byte)note);
			if (keyRegistry.TryGetValue(key, out var value) && value.Count > 0)
			{
				value[0].Stop();
				value.RemoveAt(0);
			}
		}

		public void NoteOffAll(bool immediate)
		{
			if (keyRegistry.Keys.Count == 0 && activeVoices.Count == 0)
			{
				return;
			}
			for (LinkedListNode<Voice> linkedListNode = activeVoices.First; linkedListNode != null; linkedListNode = linkedListNode.Next)
			{
				if (immediate)
				{
					linkedListNode.Value.StopImmediately();
				}
				else
				{
					linkedListNode.Value.Stop();
				}
			}
			keyRegistry.Clear();
		}

		public void GetNext(byte[] buffer)
		{
			ClearWorkingBuffer();
			FillWorkingBuffer();
			for (int i = 0; i < effects.Count; i++)
			{
				effects[i].doEffect(sampleBuffer);
			}
			ConvertBuffer(sampleBuffer, buffer);
		}

		public void GetNext(float[] buffer)
		{
			ClearWorkingBuffer();
			FillWorkingBuffer();
			for (int i = 0; i < effects.Count; i++)
			{
				effects[i].doEffect(sampleBuffer);
			}
			ConvertBuffer(sampleBuffer, buffer);
		}

		public void AddEffect(BasicAudioEffect effect)
		{
			effects.Add(effect);
		}

		public void RemoveEffect(int index)
		{
			effects.RemoveAt(index);
		}

		public void ClearEffects()
		{
			effects.Clear();
		}

		private Voice getFreeVoice()
		{
			if (freeVoices.Count == 0)
			{
				return null;
			}
			return freeVoices.Pop();
		}

		private Voice getUsedVoice(NoteRegistryKey r)
		{
			if (keyRegistry.TryGetValue(r, out var value) && value.Count > 0)
			{
				value[0].StopImmediately();
				Voice voice = value[0];
				value.RemoveAt(0);
				activeVoices.Remove(voice);
				return voice;
			}
			return null;
		}

		private void ConvertBuffer(float[,] from, byte[] to)
		{
			int length = from.GetLength(0);
			int length2 = from.GetLength(1);
			if (to.Length != length2 * length * bytesPerSample)
			{
				Debug.Log("Buffer sizes are mismatched.");
			}
			for (int i = 0; i < length2; i++)
			{
				for (int j = 0; j < length; j++)
				{
					float value = from[j, i] * MainVolume;
					value = SynthHelper.Clamp(value, -1f, 1f);
					short num = (short)((value >= 0f) ? (value * 32767f) : (value * -32768f * -1f));
					int num2 = i * length * bytesPerSample + j * bytesPerSample;
					if (!BitConverter.IsLittleEndian)
					{
						to[num2] = (byte)(num >> 8);
						to[num2 + 1] = (byte)num;
					}
					else
					{
						to[num2] = (byte)num;
						to[num2 + 1] = (byte)(num >> 8);
					}
				}
			}
		}

		private void ConvertBuffer(float[,] from, float[] to)
		{
			int length = from.GetLength(0);
			int length2 = from.GetLength(1);
			int num = 0;
			if (to.Length != length2 * length * bytesPerSample)
			{
				Debug.Log("Buffer sizes are mismatched.");
			}
			for (int i = 0; i < length2; i++)
			{
				for (int j = 0; j < length; j++)
				{
					float value = from[j, i] * MainVolume;
					value = SynthHelper.Clamp(value, -1f, 1f);
					to[num++] = value;
				}
			}
		}

		private void FillWorkingBuffer()
		{
			LinkedListNode<Voice> linkedListNode;
			if (seq != null && seq.isPlaying)
			{
				MidiSequencerEvent midiSequencerEvent = seq.Process(samplesperBuffer);
				if (midiSequencerEvent == null)
				{
					return;
				}
				int num = 0;
				int num2 = 0;
				for (int i = 0; i < midiSequencerEvent.Events.Count; i++)
				{
					num2 = (int)midiSequencerEvent.Events[i].deltaTime - seq.SampleTime - num;
					if (num2 != 0)
					{
						linkedListNode = activeVoices.First;
						while (linkedListNode != null)
						{
							if (num < 0 || num2 < 0)
							{
								throw new Exception("dd");
							}
							linkedListNode.Value.Process(sampleBuffer, num, num + num2);
							if (!linkedListNode.Value.isInUse)
							{
								LinkedListNode<Voice> linkedListNode2 = linkedListNode;
								linkedListNode = linkedListNode.Next;
								freeVoices.Push(linkedListNode2.Value);
								activeVoices.Remove(linkedListNode2);
							}
							else
							{
								linkedListNode = linkedListNode.Next;
							}
						}
					}
					num += num2;
					seq.ProcessMidiEvent(midiSequencerEvent.Events[i]);
				}
				if (num < samplesperBuffer)
				{
					linkedListNode = activeVoices.First;
					while (linkedListNode != null)
					{
						linkedListNode.Value.Process(sampleBuffer, num, samplesperBuffer);
						if (!linkedListNode.Value.isInUse)
						{
							LinkedListNode<Voice> linkedListNode2 = linkedListNode;
							linkedListNode = linkedListNode.Next;
							freeVoices.Push(linkedListNode2.Value);
							activeVoices.Remove(linkedListNode2);
						}
						else
						{
							linkedListNode = linkedListNode.Next;
						}
					}
				}
				seq.IncrementSampleCounter(samplesperBuffer);
				return;
			}
			linkedListNode = activeVoices.First;
			while (linkedListNode != null)
			{
				linkedListNode.Value.Process(sampleBuffer, 0, samplesperBuffer);
				if (!linkedListNode.Value.isInUse)
				{
					LinkedListNode<Voice> linkedListNode2 = linkedListNode;
					linkedListNode = linkedListNode.Next;
					freeVoices.Push(linkedListNode2.Value);
					activeVoices.Remove(linkedListNode2);
				}
				else
				{
					linkedListNode = linkedListNode.Next;
				}
			}
		}

		private void ClearWorkingBuffer()
		{
			Array.Clear(sampleBuffer, 0, audioChannels * samplesperBuffer);
		}

		private void setupSynth()
		{
			if (sampleRate < 8000 || sampleRate > 48000)
			{
				sampleRate = 44100;
				samplesperBuffer = sampleRate / 1000 * 50;
				Debug.Log("-----> Invalid Sample Rate! Changed to---->" + sampleRate);
				Debug.Log("-----> Invalid Buffer Size! Changed to---->" + 50 + "ms");
			}
			if (polyphony < 1 || polyphony > 500)
			{
				polyphony = 40;
				Debug.Log("-----> Invalid Max Poly! Changed to---->" + polyphony);
			}
			if (maxnotepoly < 1 || maxnotepoly > polyphony)
			{
				maxnotepoly = 2;
				Debug.Log("-----> Invalid Max Note Poly! Changed to---->" + maxnotepoly);
			}
			if (samplesperBuffer < 100 || samplesperBuffer > 500000)
			{
				samplesperBuffer = (int)((double)sampleRate / 1000.0 * 50.0);
				Debug.Log("-----> Invalid Buffer Size! Changed to---->" + 50 + "ms");
			}
			if (audioChannels < 1 || audioChannels > 2)
			{
				audioChannels = 1;
				Debug.Log("-----> Invalid Audio Channels! Changed to---->" + audioChannels);
			}
			if (bytesPerSample < 1 || bytesPerSample > 2)
			{
				bytesPerSample = 1;
				Debug.Log("-----> Invalid Bytes Per Sample! Changed to---->" + bytesPerSample);
			}
			sampleBuffer = new float[audioChannels, samplesperBuffer];
			rawBufferLength = audioChannels * samplesperBuffer * bytesPerSample;
			voicePool = new Voice[polyphony];
			for (int i = 0; i < polyphony; i++)
			{
				voicePool[i] = new Voice(this);
			}
			freeVoices = new Stack<Voice>(voicePool);
			activeVoices = new LinkedList<Voice>();
			keyRegistry = new Dictionary<NoteRegistryKey, List<Voice>>();
			panPositions_ = new float[16];
			volPositions_ = new float[16];
			for (int j = 0; j < volPositions_.Length; j++)
			{
				volPositions_[j] = 1f;
			}
			tunePositions_ = new double[16];
			effects = new List<BasicAudioEffect>();
		}
	}
}
