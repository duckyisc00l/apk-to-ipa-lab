namespace CSharpSynth.Midi
{
	public class MidiTrack
	{
		public uint NotesPlayed;

		public ulong TotalTime;

		public byte[] Programs;

		public byte[] DrumPrograms;

		public MidiEvent[] MidiEvents;

		public int EventCount => MidiEvents.Length;

		public MidiTrack()
		{
			NotesPlayed = 0u;
			TotalTime = 0uL;
		}

		public bool ContainsProgram(byte program)
		{
			for (int i = 0; i < Programs.Length; i++)
			{
				if (Programs[i] == program)
				{
					return true;
				}
			}
			return false;
		}

		public bool ContainsDrumProgram(byte drumprogram)
		{
			for (int i = 0; i < DrumPrograms.Length; i++)
			{
				if (DrumPrograms[i] == drumprogram)
				{
					return true;
				}
			}
			return false;
		}
	}
}
