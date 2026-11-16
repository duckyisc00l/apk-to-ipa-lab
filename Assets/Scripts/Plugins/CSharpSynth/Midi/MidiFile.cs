using System;
using System.Collections.Generic;
using System.IO;
using System.Text;
using UnityEngine;

namespace CSharpSynth.Midi
{
	public class MidiFile
	{
		private uint BPM = 120u;

		private uint MPQN = 500000u;

		private bool sequenceReadyFormat;

		private MidiHeader mheader;

		private MidiTrack[] tracks;

		public bool SequencerReady
		{
			get
			{
				return sequenceReadyFormat;
			}
			set
			{
				sequenceReadyFormat = value;
			}
		}

		public MidiTrack[] Tracks => tracks;

		public uint BeatsPerMinute
		{
			get
			{
				return BPM;
			}
			set
			{
				BPM = value;
				MPQN = 60000000 / BPM;
			}
		}

		public uint MicroSecondsPerQuarterNote
		{
			get
			{
				return MPQN;
			}
			set
			{
				MPQN = value;
				BPM = 60000000 / MPQN;
			}
		}

		public MidiHeader MidiHeader => mheader;

		public static MidiFile CreateFromFile(string filePath)
		{
			return new MidiFile(File.Open(filePath, FileMode.Open));
		}

		public static MidiFile CreateFromTextAsset(string resourcePath)
		{
			return new MidiFile(new MemoryStream((Resources.Load(resourcePath) as TextAsset).bytes));
		}

		public List<MidiEvent> getAllMidiEventsofType(MidiHelper.MidiChannelEvent eventChannelType, MidiHelper.MidiMetaEvent eventMetaType)
		{
			List<MidiEvent> list = new List<MidiEvent>();
			for (int i = 0; i < tracks.Length; i++)
			{
				for (int j = 0; j < tracks[i].MidiEvents.Length; j++)
				{
					if (tracks[i].MidiEvents[j].midiMetaEvent == eventMetaType && tracks[i].MidiEvents[j].midiChannelEvent == eventChannelType)
					{
						list.Add(tracks[i].MidiEvents[j]);
					}
				}
			}
			return list;
		}

		public List<MidiEvent> getAllMidiEventsofType(byte channel, MidiHelper.MidiChannelEvent eventChannelType, MidiHelper.MidiMetaEvent eventMetaType)
		{
			List<MidiEvent> list = new List<MidiEvent>();
			for (int i = 0; i < tracks.Length; i++)
			{
				for (int j = 0; j < tracks[i].MidiEvents.Length; j++)
				{
					if (tracks[i].MidiEvents[j].midiMetaEvent == eventMetaType && tracks[i].MidiEvents[j].midiChannelEvent == eventChannelType && tracks[i].MidiEvents[j].channel == channel)
					{
						list.Add(tracks[i].MidiEvents[j]);
					}
				}
			}
			return list;
		}

		public void CombineTracks()
		{
			if (tracks.Length < 2)
			{
				return;
			}
			int num = 0;
			ulong num2 = 0uL;
			List<byte> list = new List<byte>();
			List<byte> list2 = new List<byte>();
			for (int i = 0; i < tracks.Length; i++)
			{
				num += tracks[i].MidiEvents.Length;
				num2 += tracks[i].NotesPlayed;
				for (int j = 0; j < tracks[i].Programs.Length; j++)
				{
					if (!list.Contains(tracks[i].Programs[j]))
					{
						list.Add(tracks[i].Programs[j]);
					}
				}
				for (int k = 0; k < tracks[i].DrumPrograms.Length; k++)
				{
					if (!list2.Contains(tracks[i].DrumPrograms[k]))
					{
						list2.Add(tracks[i].DrumPrograms[k]);
					}
				}
			}
			Dictionary<uint, LinkedList<MidiEvent>> dictionary = new Dictionary<uint, LinkedList<MidiEvent>>(num);
			for (int l = 0; l < tracks.Length; l++)
			{
				uint num3 = 0u;
				MidiEvent[] array = new MidiEvent[tracks[l].MidiEvents.Length];
				tracks[l].MidiEvents.CopyTo(array, 0);
				for (int m = 0; m < tracks[l].MidiEvents.Length; m++)
				{
					num3 += array[m].deltaTime;
					array[m].deltaTime = num3;
					if (dictionary.ContainsKey(array[m].deltaTime))
					{
						dictionary[array[m].deltaTime].AddLast(array[m]);
						continue;
					}
					LinkedList<MidiEvent> linkedList = new LinkedList<MidiEvent>();
					linkedList.AddLast(array[m]);
					dictionary.Add(array[m].deltaTime, linkedList);
				}
			}
			uint[] array2 = new uint[dictionary.Keys.Count];
			dictionary.Keys.CopyTo(array2, 0);
			Array.Sort(array2);
			tracks = new MidiTrack[1];
			LinkedList<MidiEvent>[] array3 = new LinkedList<MidiEvent>[dictionary.Values.Count];
			for (int n = 0; n < array3.Length; n++)
			{
				array3[n] = dictionary[array2[n]];
			}
			dictionary.Clear();
			array2 = null;
			tracks[0] = new MidiTrack();
			tracks[0].Programs = list.ToArray();
			tracks[0].DrumPrograms = list2.ToArray();
			tracks[0].MidiEvents = new MidiEvent[num];
			uint num4 = 0u;
			uint num5 = 0u;
			for (int num6 = 0; num6 < array3.Length; num6++)
			{
				LinkedListNode<MidiEvent> linkedListNode = array3[num6].First;
				while (linkedListNode != null)
				{
					uint deltaTime = linkedListNode.Value.deltaTime;
					linkedListNode.Value.deltaTime = linkedListNode.Value.deltaTime - num4;
					num4 = deltaTime;
					tracks[0].MidiEvents[num5] = linkedListNode.Value;
					tracks[0].TotalTime = tracks[0].TotalTime + linkedListNode.Value.deltaTime;
					linkedListNode = linkedListNode.Next;
					num5++;
				}
			}
			tracks[0].NotesPlayed = (uint)num2;
		}

		public static bool isValidMidiFile(string filename)
		{
			return true;
		}

		private MidiFile(Stream midiStream)
		{
			try
			{
				loadStream(midiStream);
			}
			catch (Exception ex)
			{
				throw ex;
			}
			finally
			{
				midiStream?.Dispose();
			}
		}

		private void loadStream(Stream stream)
		{
			byte[] array = new byte[4];
			stream.Read(array, 0, 4);
			if (Encoding.UTF8.GetString(array, 0, array.Length) != "MThd")
			{
				throw new Exception("Not a valid midi file!");
			}
			mheader = new MidiHeader();
			stream.Read(array, 0, 4);
			Array.Reverse(array);
			BitConverter.ToInt32(array, 0);
			array = new byte[2];
			stream.Read(array, 0, 2);
			Array.Reverse(array);
			mheader.setMidiFormat(BitConverter.ToInt16(array, 0));
			stream.Read(array, 0, 2);
			Array.Reverse(array);
			int num = BitConverter.ToInt16(array, 0);
			tracks = new MidiTrack[num];
			stream.Read(array, 0, 2);
			Array.Reverse(array);
			int num2 = BitConverter.ToInt16(array, 0);
			mheader.DeltaTiming = num2 & 0x7FFF;
			mheader.TimeFormat = (((num2 & 0x8000) > 0) ? MidiHelper.MidiTimeFormat.FamesPerSecond : MidiHelper.MidiTimeFormat.TicksPerBeat);
			for (int i = 0; i < num; i++)
			{
				List<byte> list = new List<byte>();
				List<byte> list2 = new List<byte>();
				List<MidiEvent> list3 = new List<MidiEvent>();
				tracks[i] = new MidiTrack();
				list.Add(0);
				list2.Add(0);
				array = new byte[4];
				stream.Read(array, 0, 4);
				if (Encoding.UTF8.GetString(array, 0, array.Length) != "MTrk")
				{
					throw new Exception("Invalid track!");
				}
				stream.Read(array, 0, 4);
				Array.Reverse(array);
				int num3 = BitConverter.ToInt32(array, 0);
				array = new byte[num3];
				stream.Read(array, 0, num3);
				int j = 0;
				byte b = 0;
				int num4 = 0;
				MidiEvent midiEvent;
				for (; j < array.Length; list3.Add(midiEvent), tracks[i].TotalTime = tracks[i].TotalTime + midiEvent.deltaTime)
				{
					ushort numOfBytes = 0;
					uint data = BitConverter.ToUInt32(array, j);
					midiEvent = new MidiEvent();
					midiEvent.deltaTime = GetTime(data, ref numOfBytes);
					j += 4 - (4 - numOfBytes);
					byte b2 = array[j];
					int num5 = GetChannel(b2);
					if (b2 < 128)
					{
						b2 = b;
						num5 = num4;
						j--;
					}
					if (b2 != byte.MaxValue)
					{
						b2 &= 0xF0;
					}
					b = b2;
					num4 = num5;
					switch (b2)
					{
					case 128:
						midiEvent.midiChannelEvent = MidiHelper.MidiChannelEvent.Note_Off;
						j++;
						midiEvent.channel = (byte)num5;
						midiEvent.Parameters[0] = midiEvent.channel;
						midiEvent.parameter1 = array[j++];
						midiEvent.parameter2 = array[j++];
						midiEvent.Parameters[1] = midiEvent.parameter1;
						midiEvent.Parameters[2] = midiEvent.parameter2;
						continue;
					case 144:
						midiEvent.midiChannelEvent = MidiHelper.MidiChannelEvent.Note_On;
						j++;
						midiEvent.channel = (byte)num5;
						midiEvent.Parameters[0] = midiEvent.channel;
						midiEvent.parameter1 = array[j++];
						midiEvent.parameter2 = array[j++];
						midiEvent.Parameters[1] = midiEvent.parameter1;
						midiEvent.Parameters[2] = midiEvent.parameter2;
						if (midiEvent.parameter2 == 0)
						{
							midiEvent.midiChannelEvent = MidiHelper.MidiChannelEvent.Note_Off;
						}
						tracks[i].NotesPlayed++;
						continue;
					case 160:
						midiEvent.midiChannelEvent = MidiHelper.MidiChannelEvent.Note_Aftertouch;
						midiEvent.channel = (byte)num5;
						midiEvent.Parameters[0] = midiEvent.channel;
						j++;
						midiEvent.parameter1 = array[++j];
						midiEvent.parameter2 = array[++j];
						continue;
					case 176:
						midiEvent.midiChannelEvent = MidiHelper.MidiChannelEvent.Controller;
						midiEvent.channel = (byte)num5;
						midiEvent.Parameters[0] = midiEvent.channel;
						j++;
						midiEvent.parameter1 = array[j++];
						midiEvent.parameter2 = array[j++];
						midiEvent.Parameters[1] = midiEvent.parameter1;
						midiEvent.Parameters[2] = midiEvent.parameter2;
						continue;
					case 192:
						midiEvent.midiChannelEvent = MidiHelper.MidiChannelEvent.Program_Change;
						midiEvent.channel = (byte)num5;
						midiEvent.Parameters[0] = midiEvent.channel;
						j++;
						midiEvent.parameter1 = array[j++];
						midiEvent.Parameters[1] = midiEvent.parameter1;
						if (midiEvent.channel != 9)
						{
							if (!list.Contains(midiEvent.parameter1))
							{
								list.Add(midiEvent.parameter1);
							}
						}
						else if (!list2.Contains(midiEvent.parameter1))
						{
							list2.Add(midiEvent.parameter1);
						}
						continue;
					case 208:
						midiEvent.midiChannelEvent = MidiHelper.MidiChannelEvent.Channel_Aftertouch;
						midiEvent.channel = (byte)num5;
						midiEvent.Parameters[0] = midiEvent.channel;
						j++;
						midiEvent.parameter1 = array[++j];
						continue;
					case 224:
					{
						midiEvent.midiChannelEvent = MidiHelper.MidiChannelEvent.Pitch_Bend;
						midiEvent.channel = (byte)num5;
						midiEvent.Parameters[0] = midiEvent.channel;
						j++;
						midiEvent.parameter1 = array[++j];
						midiEvent.parameter2 = array[++j];
						ushort parameter = midiEvent.parameter1;
						parameter <<= 7;
						parameter |= midiEvent.parameter2;
						midiEvent.Parameters[1] = ((double)(int)parameter - 8192.0) / 8192.0;
						continue;
					}
					case byte.MaxValue:
						switch (array[++j])
						{
						case 0:
							midiEvent.midiMetaEvent = MidiHelper.MidiMetaEvent.Sequence_Number;
							j++;
							break;
						case 1:
							midiEvent.midiMetaEvent = MidiHelper.MidiMetaEvent.Text_Event;
							j++;
							midiEvent.parameter1 = array[j++];
							midiEvent.Parameters[0] = midiEvent.parameter1;
							midiEvent.Parameters[1] = Encoding.UTF8.GetString(array, j, array[j - 1]);
							j += array[j - 1];
							break;
						case 2:
							midiEvent.midiMetaEvent = MidiHelper.MidiMetaEvent.Copyright_Notice;
							j++;
							midiEvent.parameter1 = array[j++];
							midiEvent.Parameters[0] = midiEvent.parameter1;
							midiEvent.Parameters[1] = Encoding.UTF8.GetString(array, j, array[j - 1]);
							j += array[j - 1];
							break;
						case 3:
							midiEvent.midiMetaEvent = MidiHelper.MidiMetaEvent.Sequence_Or_Track_Name;
							j++;
							midiEvent.parameter1 = array[j++];
							midiEvent.Parameters[0] = midiEvent.parameter1;
							midiEvent.Parameters[1] = Encoding.UTF8.GetString(array, j, array[j - 1]);
							j += array[j - 1];
							break;
						case 4:
							midiEvent.midiMetaEvent = MidiHelper.MidiMetaEvent.Instrument_Name;
							j++;
							midiEvent.Parameters[0] = Encoding.UTF8.GetString(array, j + 1, array[j]);
							j += array[j] + 1;
							break;
						case 5:
							midiEvent.midiMetaEvent = MidiHelper.MidiMetaEvent.Lyric_Text;
							j++;
							midiEvent.Parameters[0] = Encoding.UTF8.GetString(array, j + 1, array[j]);
							j += array[j] + 1;
							break;
						case 6:
							midiEvent.midiMetaEvent = MidiHelper.MidiMetaEvent.Marker_Text;
							j++;
							midiEvent.Parameters[0] = Encoding.UTF8.GetString(array, j + 1, array[j]);
							j += array[j] + 1;
							break;
						case 7:
							midiEvent.midiMetaEvent = MidiHelper.MidiMetaEvent.Cue_Point;
							j++;
							midiEvent.Parameters[0] = Encoding.UTF8.GetString(array, j + 1, array[j]);
							j += array[j] + 1;
							break;
						case 32:
							midiEvent.midiMetaEvent = MidiHelper.MidiMetaEvent.Midi_Channel_Prefix_Assignment;
							j++;
							midiEvent.parameter1 = array[j++];
							midiEvent.Parameters[0] = midiEvent.parameter1;
							midiEvent.Parameters[1] = array[j++];
							break;
						case 47:
							midiEvent.midiMetaEvent = MidiHelper.MidiMetaEvent.End_of_Track;
							j += 2;
							break;
						case 81:
						{
							midiEvent.midiMetaEvent = MidiHelper.MidiMetaEvent.Tempo;
							j++;
							midiEvent.Parameters[4] = array[j++];
							byte[] array3 = new byte[4];
							for (int num15 = 0; num15 < 3; num15++)
							{
								array3[num15 + 1] = array[num15 + j];
							}
							j += 3;
							byte[] array4 = new byte[4];
							for (int num16 = 0; num16 < 4; num16++)
							{
								array4[3 - num16] = array3[num16];
							}
							uint num17 = BitConverter.ToUInt32(array4, 0);
							midiEvent.Parameters[0] = num17;
							break;
						}
						case 84:
						{
							midiEvent.midiMetaEvent = MidiHelper.MidiMetaEvent.Smpte_Offset;
							j++;
							int num7 = array[j++];
							if (num7 >= 4)
							{
								for (int num8 = 0; num8 < 4; num8++)
								{
									midiEvent.Parameters[num8] = array[j++];
								}
							}
							else
							{
								for (int num9 = 0; num9 < num7; num9++)
								{
									midiEvent.Parameters[num9] = array[j++];
								}
							}
							for (int num10 = 4; num10 < num7; num10++)
							{
								j++;
							}
							break;
						}
						case 88:
						{
							midiEvent.midiMetaEvent = MidiHelper.MidiMetaEvent.Time_Signature;
							j++;
							int num11 = array[j++];
							if (num11 >= 4)
							{
								for (int num12 = 0; num12 < 4; num12++)
								{
									midiEvent.Parameters[num12] = array[j++];
								}
							}
							else
							{
								for (int num13 = 0; num13 < num11; num13++)
								{
									midiEvent.Parameters[num13] = array[j++];
								}
							}
							for (int num14 = 4; num14 < num11; num14++)
							{
								j++;
							}
							break;
						}
						case 89:
						{
							midiEvent.midiMetaEvent = MidiHelper.MidiMetaEvent.Key_Signature;
							j++;
							int num6 = array[j++];
							if (num6 >= 4)
							{
								for (int l = 0; l < 4; l++)
								{
									midiEvent.Parameters[l] = array[j++];
								}
							}
							else
							{
								for (int m = 0; m < num6; m++)
								{
									midiEvent.Parameters[m] = array[j++];
								}
							}
							for (int n = 4; n < num6; n++)
							{
								j++;
							}
							break;
						}
						case 127:
						{
							midiEvent.midiMetaEvent = MidiHelper.MidiMetaEvent.Sequencer_Specific_Event;
							j++;
							midiEvent.Parameters[4] = array[j++];
							byte[] array2 = new byte[(byte)midiEvent.Parameters[4]];
							for (int k = 0; k < array2.Length; k++)
							{
								array2[k] = array[j++];
							}
							midiEvent.Parameters[0] = array2;
							break;
						}
						}
						continue;
					case 240:
						break;
					default:
						continue;
					}
					for (; array[j] != 247; j++)
					{
					}
					j++;
				}
				tracks[i].Programs = list.ToArray();
				tracks[i].DrumPrograms = list2.ToArray();
				tracks[i].MidiEvents = list3.ToArray();
			}
		}

		private int GetChannel(byte statusbyte)
		{
			statusbyte <<= 4;
			return statusbyte >> 4;
		}

		private uint GetTime(uint data, ref ushort numOfBytes)
		{
			byte[] bytes = BitConverter.GetBytes(data);
			numOfBytes++;
			for (int i = 0; i < bytes.Length && (bytes[i] & 0x80) > 0; i++)
			{
				numOfBytes++;
			}
			for (int j = numOfBytes; j < 4; j++)
			{
				bytes[j] = 0;
			}
			Array.Reverse(bytes);
			data = BitConverter.ToUInt32(bytes, 0);
			data >>= 32 - numOfBytes * 8;
			uint num = data & 0x7F;
			int num2 = 1;
			while ((data >>= 8) != 0)
			{
				num |= (data & 0x7F) << 7 * num2;
				num2++;
			}
			return num;
		}
	}
}
