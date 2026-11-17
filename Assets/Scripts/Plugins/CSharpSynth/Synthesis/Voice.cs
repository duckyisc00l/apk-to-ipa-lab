using System;
using CSharpSynth.Banks;

namespace CSharpSynth.Synthesis
{
	public class Voice
	{
		private enum VoiceState
		{
			None = 0,
			Attack = 1,
			Sustain = 2,
			Hold = 3,
			Release = 4
		}

		private Instrument inst;

		private int note;

		private int velocity;

		private int attack;

		private int release;

		private int hold;

		private int decay;

		private int channel;

		private float pan;

		private float rightpan;

		private float leftpan;

		private double variableSampleRate;

		private bool inUse;

		private VoiceState state;

		private StreamSynthesizer synth;

		private double time;

		private float fadeMultiplier;

		private int fadeCounter;

		private int decayCounter;

		private float gainControl = 0.3f;

		public bool isInUse => inUse;

		public Voice(StreamSynthesizer synth)
		{
			resetVoice();
			this.synth = synth;
			inst = null;
		}

		public Voice(StreamSynthesizer synth, Instrument inst)
		{
			resetVoice();
			this.synth = synth;
			setInstrument(inst);
		}

		public void setInstrument(Instrument inst)
		{
			if (this.inst != inst)
			{
				this.inst = inst;
			}
		}

		public Instrument getInstrument()
		{
			return inst;
		}

		public void Start(int channel, int note, int velocity)
		{
			this.note = note;
			this.velocity = velocity;
			this.channel = channel;
			time = 0.0;
			fadeMultiplier = 1f;
			decayCounter = 0;
			fadeCounter = 0;
			attack = inst.getAttack(note);
			release = inst.getRelease(note);
			hold = inst.getHold(note);
			decay = inst.getDecay(note);
			decayCounter = decay;
			if (attack == 0)
			{
				state = VoiceState.Sustain;
			}
			else
			{
				state = VoiceState.Attack;
				fadeCounter = attack;
			}
			inUse = true;
		}

		public void Stop()
		{
			StopImmediately();
		}

		public void StopImmediately()
		{
			state = VoiceState.None;
			inUse = false;
		}

		public void setPan(float pan)
		{
			if (pan >= -1f && pan <= 1f && this.pan != pan)
			{
				this.pan = pan;
				if (pan > 0f)
				{
					rightpan = 1f;
					leftpan = 1f - pan;
				}
				else
				{
					leftpan = 1f;
					rightpan = 1f + pan;
				}
			}
		}

		public float getPan()
		{
			return pan;
		}

		public NoteRegistryKey getKey()
		{
			return new NoteRegistryKey((byte)channel, (byte)note);
		}

		public void Process(float[,] workingBuffer, int startIndex, int endIndex)
		{
			if (!inUse)
			{
				return;
			}
			if (synth.Channels == 2 && pan != synth.PanPositions[channel])
			{
				setPan(synth.PanPositions[channel]);
			}
			variableSampleRate = (double)synth.SampleRate * Math.Pow(2.0, synth.TunePositions[channel] * -1.0 / 12.0);
			for (int i = startIndex; i < endIndex; i++)
			{
				switch (state)
				{
				case VoiceState.Attack:
					fadeCounter--;
					if (fadeCounter <= 0)
					{
						state = VoiceState.Sustain;
						fadeMultiplier = 1f;
					}
					else
					{
						fadeMultiplier = 1f - (float)fadeCounter / (float)attack;
					}
					break;
				case VoiceState.Sustain:
					decayCounter--;
					if (decayCounter <= 0)
					{
						state = VoiceState.None;
						inUse = false;
						fadeMultiplier = 0f;
					}
					else
					{
						fadeMultiplier = (float)decayCounter / (float)decay;
					}
					break;
				case VoiceState.Hold:
					fadeCounter--;
					decayCounter--;
					if (decayCounter <= 0)
					{
						state = VoiceState.None;
						inUse = false;
						fadeMultiplier = 0f;
					}
					else if (fadeCounter <= 0)
					{
						state = VoiceState.Release;
						fadeCounter = release;
					}
					else
					{
						fadeMultiplier = (float)decayCounter / (float)decay;
					}
					break;
				case VoiceState.Release:
					fadeCounter--;
					if (fadeCounter <= 0)
					{
						state = VoiceState.None;
						inUse = false;
					}
					else
					{
						fadeMultiplier = (float)decayCounter / (float)decay * ((float)fadeCounter / (float)release);
					}
					break;
				}
				if (synth.Channels == 1)
				{
					float sampleAtTime = inst.getSampleAtTime(note, 0, synth.SampleRate, ref time);
					sampleAtTime = sampleAtTime * ((float)velocity / 127f) * synth.VolPositions[channel];
					workingBuffer[0, i] += sampleAtTime * fadeMultiplier * gainControl;
				}
				else if (synth.Channels == 2 && !inst.allSamplesSupportDualChannel())
				{
					float sampleAtTime2 = inst.getSampleAtTime(note, 0, synth.SampleRate, ref time);
					sampleAtTime2 = sampleAtTime2 * ((float)velocity / 127f) * synth.VolPositions[channel];
					workingBuffer[0, i] += sampleAtTime2 * fadeMultiplier * leftpan * gainControl;
					workingBuffer[1, i] += sampleAtTime2 * fadeMultiplier * rightpan * gainControl;
				}
				time += 1.0 / variableSampleRate;
				if (!inUse)
				{
					break;
				}
			}
		}

		private void resetVoice()
		{
			inUse = false;
			state = VoiceState.None;
			note = 0;
			time = 0.0;
			fadeMultiplier = 1f;
			decayCounter = 0;
			fadeCounter = 0;
			pan = 0f;
			channel = 0;
			rightpan = 1f;
			leftpan = 1f;
			velocity = 127;
		}
	}
}
