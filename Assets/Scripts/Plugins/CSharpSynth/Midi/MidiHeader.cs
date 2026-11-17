namespace CSharpSynth.Midi
{
	public class MidiHeader
	{
		public int DeltaTiming;

		public MidiHelper.MidiFormat MidiFormat;

		public MidiHelper.MidiTimeFormat TimeFormat;

		public void setMidiFormat(int format)
		{
			switch (format)
			{
			case 0:
				MidiFormat = MidiHelper.MidiFormat.SingleTrack;
				break;
			case 1:
				MidiFormat = MidiHelper.MidiFormat.MultiTrack;
				break;
			case 2:
				MidiFormat = MidiHelper.MidiFormat.MultiSong;
				break;
			}
		}
	}
}
