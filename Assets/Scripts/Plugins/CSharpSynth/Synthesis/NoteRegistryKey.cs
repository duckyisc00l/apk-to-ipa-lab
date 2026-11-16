using System;

namespace CSharpSynth.Synthesis
{
	public struct NoteRegistryKey
	{
		private readonly byte note;

		private readonly byte channel;

		public byte Note => note;

		public byte Channel => channel;

		public NoteRegistryKey(byte channel, byte note)
		{
			this.note = note;
			this.channel = channel;
		}

		public override bool Equals(object obj)
		{
			if (obj is NoteRegistryKey noteRegistryKey)
			{
				if (noteRegistryKey.channel == channel)
				{
					return noteRegistryKey.note == note;
				}
				return false;
			}
			return false;
		}

		public bool Equals(NoteRegistryKey obj)
		{
			if (obj.channel == channel)
			{
				return obj.note == note;
			}
			return false;
		}

		public override int GetHashCode()
		{
			return BitConverter.ToInt32(new byte[4] { note, channel, 0, 0 }, 0);
		}
	}
}
