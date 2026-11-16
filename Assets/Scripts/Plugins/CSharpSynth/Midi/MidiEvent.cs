namespace CSharpSynth.Midi
{
	public class MidiEvent
	{
		public uint deltaTime;

		public MidiHelper.MidiMetaEvent midiMetaEvent;

		public MidiHelper.MidiChannelEvent midiChannelEvent;

		public object[] Parameters;

		public byte parameter1;

		public byte parameter2;

		public byte channel;

		public MidiEvent()
		{
			Parameters = new object[5];
			midiMetaEvent = MidiHelper.MidiMetaEvent.None;
			midiChannelEvent = MidiHelper.MidiChannelEvent.None;
		}

		public bool isMetaEvent()
		{
			return midiChannelEvent == MidiHelper.MidiChannelEvent.None;
		}

		public bool isChannelEvent()
		{
			return midiMetaEvent == MidiHelper.MidiMetaEvent.None;
		}

		public MidiHelper.ControllerType GetControllerType()
		{
			if (midiChannelEvent != MidiHelper.MidiChannelEvent.Controller)
			{
				return MidiHelper.ControllerType.None;
			}
			return parameter1 switch
			{
				1 => MidiHelper.ControllerType.Modulation, 
				7 => MidiHelper.ControllerType.MainVolume, 
				10 => MidiHelper.ControllerType.Pan, 
				64 => MidiHelper.ControllerType.DamperPedal, 
				121 => MidiHelper.ControllerType.ResetControllers, 
				123 => MidiHelper.ControllerType.AllNotesOff, 
				_ => MidiHelper.ControllerType.Unknown, 
			};
		}
	}
}
