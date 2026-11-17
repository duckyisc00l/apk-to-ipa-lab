using System;
using System.Collections.Generic;
using CSharpSynth.Banks;
using CSharpSynth.Midi;
using CSharpSynth.Synthesis;
using UnityEngine;

namespace CSharpSynth.Sequencer
{
	public class MidiSequencer
	{
		public delegate void NoteOnEventHandler(int channel, int note, int velocity);

		public delegate void NoteOffEventHandler(int channel, int note);

		private MidiFile _MidiFile;

		private StreamSynthesizer synth;

		private int[] currentPrograms;

		private List<byte> blockList;

		private double PitchWheelSemitoneRange = 2.0;

		private bool playing;

		private bool looping;

		private MidiSequencerEvent seqEvt;

		private int sampleTime;

		private int eventIndex;

		public bool isPlaying => playing;

		public int SampleTime => sampleTime;

		public int EndSampleTime => (int)_MidiFile.Tracks[0].TotalTime;

		public TimeSpan EndTime => new TimeSpan(0, 0, (int)SynthHelper.getTimeFromSample(synth.SampleRate, (int)_MidiFile.Tracks[0].TotalTime));

		public TimeSpan Time
		{
			get
			{
				return new TimeSpan(0, 0, (int)SynthHelper.getTimeFromSample(synth.SampleRate, sampleTime));
			}
			set
			{
				SetTime(value);
			}
		}

		public double PitchWheelRange
		{
			get
			{
				return PitchWheelSemitoneRange;
			}
			set
			{
				PitchWheelSemitoneRange = value;
			}
		}

		public bool Looping
		{
			get
			{
				return looping;
			}
			set
			{
				looping = value;
			}
		}

		public event NoteOnEventHandler NoteOnEvent;

		public event NoteOffEventHandler NoteOffEvent;

		public MidiSequencer(StreamSynthesizer synth)
		{
			currentPrograms = new int[16];
			this.synth = synth;
			this.synth.setSequencer(this);
			blockList = new List<byte>();
			seqEvt = new MidiSequencerEvent();
		}

		public string getProgramName(int channel)
		{
			if (channel == 9)
			{
				return synth.SoundBank.getInstrument(currentPrograms[channel], isDrum: true).Name;
			}
			return synth.SoundBank.getInstrument(currentPrograms[channel], isDrum: false).Name;
		}

		public int getProgramIndex(int channel)
		{
			return currentPrograms[channel];
		}

		public void setProgram(int channel, int program)
		{
			currentPrograms[channel] = program;
		}

		public MidiFile LoadMidi(MidiFile midi, bool UnloadUnusedInstruments)
		{
			if (playing)
			{
				return null;
			}
			_MidiFile = midi;
			if (!_MidiFile.SequencerReady)
			{
				_MidiFile.CombineTracks();
				eventIndex = 0;
				uint num = 0u;
				for (int i = 0; i < _MidiFile.Tracks[0].MidiEvents.Length; i++)
				{
					_MidiFile.Tracks[0].MidiEvents[i].deltaTime = num + (uint)DeltaTimetoSamples(_MidiFile.Tracks[0].MidiEvents[i].deltaTime);
					num = _MidiFile.Tracks[0].MidiEvents[i].deltaTime;
					if (_MidiFile.Tracks[0].MidiEvents[i].midiMetaEvent == MidiHelper.MidiMetaEvent.Tempo)
					{
						_MidiFile.BeatsPerMinute = 60000000 / Convert.ToUInt32(_MidiFile.Tracks[0].MidiEvents[i].Parameters[0]);
					}
				}
				_MidiFile.Tracks[0].TotalTime = _MidiFile.Tracks[0].MidiEvents[_MidiFile.Tracks[0].MidiEvents.Length - 1].deltaTime;
				_MidiFile.BeatsPerMinute = 120u;
				_MidiFile.SequencerReady = true;
			}
			blockList.Clear();
			if (UnloadUnusedInstruments)
			{
				if (synth.SoundBank == null)
				{
					Debug.LogWarning("No Soundbank loaded !");
				}
				else
				{
					string bankPath = synth.SoundBank.BankPath;
					synth.UnloadBank();
					BankManager.addBank(new InstrumentBank(synth.SampleRate, bankPath, _MidiFile.Tracks[0].Programs, _MidiFile.Tracks[0].DrumPrograms));
					synth.SwitchBank(BankManager.Count - 1);
				}
			}
			return _MidiFile;
		}

		public MidiFile LoadMidiFromTextAsset(string file, bool UnloadUnusedInstruments)
		{
			if (playing)
			{
				return null;
			}
			MidiFile midi = MidiFile.CreateFromTextAsset(file);
			return LoadMidi(midi, UnloadUnusedInstruments);
		}

		public MidiFile LoadMidiFromFile(string file, bool UnloadUnusedInstruments)
		{
			if (playing)
			{
				return null;
			}
			MidiFile midi = MidiFile.CreateFromFile(file);
			return LoadMidi(midi, UnloadUnusedInstruments);
		}

		public void Play()
		{
			if (!playing)
			{
				Array.Clear(currentPrograms, 0, currentPrograms.Length);
				ResetControllers();
				_MidiFile.BeatsPerMinute = 120u;
				eventIndex = 0;
				playing = true;
			}
		}

		public void Stop(bool immediate)
		{
			playing = false;
			sampleTime = 0;
			if (immediate)
			{
				synth.NoteOffAll(immediate: true);
			}
			else
			{
				synth.NoteOffAll(immediate: false);
			}
		}

		public bool isChannelMuted(int channel)
		{
			if (blockList.Contains((byte)channel))
			{
				return true;
			}
			return false;
		}

		public void MuteChannel(int channel)
		{
			if (channel > -1 && channel < 16 && !blockList.Contains((byte)channel))
			{
				blockList.Add((byte)channel);
			}
		}

		public void UnMuteChannel(int channel)
		{
			if (channel > -1 && channel < 16)
			{
				blockList.Remove((byte)channel);
			}
		}

		public void MuteAllChannels()
		{
			for (int i = 0; i < 16; i++)
			{
				blockList.Add((byte)i);
			}
		}

		public void UnMuteAllChannels()
		{
			blockList.Clear();
		}

		public void ResetControllers()
		{
			Array.Clear(synth.PanPositions, 0, synth.PanPositions.Length);
			Array.Clear(synth.TunePositions, 0, synth.TunePositions.Length);
			for (int i = 0; i < synth.VolPositions.Length; i++)
			{
				synth.VolPositions[i] = 1f;
			}
		}

		public MidiSequencerEvent Process(int frame)
		{
			seqEvt.Events.Clear();
			if (sampleTime >= (int)_MidiFile.Tracks[0].TotalTime)
			{
				sampleTime = 0;
				if (!looping)
				{
					playing = false;
					synth.NoteOffAll(immediate: true);
					return null;
				}
				Array.Clear(currentPrograms, 0, currentPrograms.Length);
				ResetControllers();
				_MidiFile.BeatsPerMinute = 120u;
				eventIndex = 0;
			}
			while (eventIndex < _MidiFile.Tracks[0].EventCount && _MidiFile.Tracks[0].MidiEvents[eventIndex].deltaTime < sampleTime + frame)
			{
				seqEvt.Events.Add(_MidiFile.Tracks[0].MidiEvents[eventIndex]);
				eventIndex++;
			}
			return seqEvt;
		}

		public void IncrementSampleCounter(int amount)
		{
			sampleTime += amount;
		}

		public void ProcessMidiEvent(MidiEvent midiEvent)
		{
			if (midiEvent.midiChannelEvent != MidiHelper.MidiChannelEvent.None)
			{
				switch (midiEvent.midiChannelEvent)
				{
				case MidiHelper.MidiChannelEvent.Program_Change:
					if (midiEvent.channel != 9)
					{
						if (midiEvent.parameter1 < synth.SoundBank.InstrumentCount)
						{
							currentPrograms[midiEvent.channel] = midiEvent.parameter1;
						}
					}
					else if (midiEvent.parameter1 < synth.SoundBank.DrumCount)
					{
						currentPrograms[midiEvent.channel] = midiEvent.parameter1;
					}
					break;
				case MidiHelper.MidiChannelEvent.Note_On:
					if (!blockList.Contains(midiEvent.channel))
					{
						if (NoteOnEvent != null)
						{
							NoteOnEvent(midiEvent.channel, midiEvent.parameter1, midiEvent.parameter2);
						}
						synth.NoteOn(midiEvent.channel, midiEvent.parameter1, midiEvent.parameter2, currentPrograms[midiEvent.channel]);
					}
					break;
				case MidiHelper.MidiChannelEvent.Note_Off:
					if (NoteOffEvent != null)
					{
						NoteOffEvent(midiEvent.channel, midiEvent.parameter1);
					}
					synth.NoteOff(midiEvent.channel, midiEvent.parameter1);
					break;
				case MidiHelper.MidiChannelEvent.Pitch_Bend:
					synth.TunePositions[midiEvent.channel] = (double)midiEvent.Parameters[1] * PitchWheelSemitoneRange;
					break;
				case MidiHelper.MidiChannelEvent.Controller:
					switch (midiEvent.GetControllerType())
					{
					case MidiHelper.ControllerType.AllNotesOff:
						synth.NoteOffAll(immediate: true);
						break;
					case MidiHelper.ControllerType.MainVolume:
						synth.VolPositions[midiEvent.channel] = (float)(int)midiEvent.parameter2 / 127f;
						break;
					case MidiHelper.ControllerType.Pan:
						synth.PanPositions[midiEvent.channel] = ((midiEvent.parameter2 - 64 == 63) ? 1f : ((float)(midiEvent.parameter2 - 64) / 64f));
						break;
					case MidiHelper.ControllerType.ResetControllers:
						ResetControllers();
						break;
					}
					break;
				case MidiHelper.MidiChannelEvent.Note_Aftertouch:
				case MidiHelper.MidiChannelEvent.Channel_Aftertouch:
					break;
				}
			}
			else if (midiEvent.midiMetaEvent == MidiHelper.MidiMetaEvent.Tempo)
			{
				_MidiFile.BeatsPerMinute = 60000000 / Convert.ToUInt32(midiEvent.Parameters[0]);
			}
		}

		public void Dispose()
		{
			Stop(immediate: true);
			synth = null;
			_MidiFile = null;
			seqEvt = null;
		}

		private int DeltaTimetoSamples(uint DeltaTime)
		{
			return SynthHelper.getSampleFromTime(synth.SampleRate, (float)DeltaTime * (60f / (float)((int)_MidiFile.BeatsPerMinute * _MidiFile.MidiHeader.DeltaTiming)));
		}

		private void SetTime(TimeSpan time)
		{
			int sampleFromTime = SynthHelper.getSampleFromTime(synth.SampleRate, (float)time.TotalSeconds);
			if (sampleFromTime > sampleTime)
			{
				SilentProcess(sampleFromTime - sampleTime);
			}
			else if (sampleFromTime < sampleTime)
			{
				synth.Stop();
				sampleTime = 0;
				Array.Clear(currentPrograms, 0, currentPrograms.Length);
				ResetControllers();
				_MidiFile.BeatsPerMinute = 120u;
				eventIndex = 0;
				SilentProcess(sampleFromTime);
			}
		}

		private void SilentProcess(int amount)
		{
			while (eventIndex < _MidiFile.Tracks[0].EventCount && _MidiFile.Tracks[0].MidiEvents[eventIndex].deltaTime < sampleTime + amount)
			{
				if (_MidiFile.Tracks[0].MidiEvents[eventIndex].midiChannelEvent != MidiHelper.MidiChannelEvent.Note_On)
				{
					ProcessMidiEvent(_MidiFile.Tracks[0].MidiEvents[eventIndex]);
				}
				eventIndex++;
			}
			sampleTime += amount;
		}
	}
}
