using System.Collections.Generic;

public class SongEditorMemento
{
	public List<Voice> Voices { get; private set; } = new List<Voice>();

	public List<SongEditorEnumLayer> Layers { get; private set; } = new List<SongEditorEnumLayer>();

	public float Bpm { get; set; }

	public float MusicGap { get; set; }
}
