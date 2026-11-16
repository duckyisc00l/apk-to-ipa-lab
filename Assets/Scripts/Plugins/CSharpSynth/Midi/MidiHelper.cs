namespace CSharpSynth.Midi
{
	public static class MidiHelper
	{
		public enum MidiTimeFormat
		{
			TicksPerBeat = 0,
			FamesPerSecond = 1
		}

		public enum MidiChannelEvent
		{
			None = 0,
			Note_On = 1,
			Note_Off = 2,
			Note_Aftertouch = 3,
			Controller = 4,
			Program_Change = 5,
			Channel_Aftertouch = 6,
			Pitch_Bend = 7,
			Unknown = 8
		}

		public enum ControllerType
		{
			None = 0,
			BankSelect = 1,
			Modulation = 2,
			BreathController = 3,
			FootController = 4,
			PortamentoTime = 5,
			DataEntry = 6,
			MainVolume = 7,
			Balance = 8,
			Pan = 9,
			ExpressionController = 10,
			EffectControl1 = 11,
			EffectControl2 = 12,
			GeneralPurposeController1 = 13,
			GeneralPurposeController2 = 14,
			GeneralPurposeController3 = 15,
			GeneralPurposeController4 = 16,
			DamperPedal = 17,
			Portamento = 18,
			Sostenuto = 19,
			SoftPedal = 20,
			LegatoFootswitch = 21,
			Hold2 = 22,
			SoundController1 = 23,
			SoundController2 = 24,
			SoundController3 = 25,
			SoundController4 = 26,
			SoundController6 = 27,
			SoundController7 = 28,
			SoundController8 = 29,
			SoundController9 = 30,
			SoundController10 = 31,
			GeneralPurposeController5 = 32,
			GeneralPurposeController6 = 33,
			GeneralPurposeController7 = 34,
			GeneralPurposeController8 = 35,
			PortamentoControl = 36,
			Effects1Depth = 37,
			Effects2Depth = 38,
			Effects3Depth = 39,
			Effects4Depth = 40,
			Effects5Depth = 41,
			DataIncrement = 42,
			DataDecrement = 43,
			NonRegisteredParameter = 44,
			RegisteredParameter = 45,
			ResetControllers = 46,
			AllNotesOff = 47,
			OmniModeOn = 48,
			OmniModeOff = 49,
			Unknown = 50
		}

		public enum MidiMetaEvent
		{
			None = 0,
			Sequence_Number = 1,
			Text_Event = 2,
			Copyright_Notice = 3,
			Sequence_Or_Track_Name = 4,
			Instrument_Name = 5,
			Lyric_Text = 6,
			Marker_Text = 7,
			Cue_Point = 8,
			Midi_Channel_Prefix_Assignment = 9,
			End_of_Track = 10,
			Tempo = 11,
			Smpte_Offset = 12,
			Time_Signature = 13,
			Key_Signature = 14,
			Sequencer_Specific_Event = 15,
			Unknown = 16
		}

		public enum MidiFormat
		{
			SingleTrack = 0,
			MultiTrack = 1,
			MultiSong = 2
		}

		public const uint MicroSecondsPerMinute = 60000000u;

		public const int Max_MidiChannel = 15;

		public const int Min_MidiChannel = 0;

		public const int Drum_Channel = 9;

		public const byte Max_NoteNumber = 127;

		public const byte Min_NoteNumber = 0;

		public const byte Max_Velocity = 127;

		public const byte Min_Velocity = 0;

		public const byte Max_Controller = 127;

		public const byte Min_Controller = 0;

		public const byte Max_GenericParameter = 127;

		public const byte Min_GenericParameter = 0;
	}
}
