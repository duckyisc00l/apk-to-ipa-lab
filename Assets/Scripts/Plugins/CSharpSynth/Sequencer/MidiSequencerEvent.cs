using System.Collections.Generic;
using CSharpSynth.Midi;

namespace CSharpSynth.Sequencer
{
	public class MidiSequencerEvent
	{
		public List<MidiEvent> Events;

		public MidiSequencerEvent()
		{
			Events = new List<MidiEvent>();
		}
	}
}
