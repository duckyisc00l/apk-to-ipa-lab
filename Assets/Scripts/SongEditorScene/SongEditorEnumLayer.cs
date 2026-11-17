using System.Collections.Generic;

public class SongEditorEnumLayer : AbstractSongEditorLayer
{
	private readonly List<Note> notes = new List<Note>();

	private readonly HashSet<Note> notesHashSet = new HashSet<Note>();

	public ESongEditorLayer LayerEnum { get; private set; }

	public SongEditorEnumLayer(ESongEditorLayer layerEnum)
	{
		LayerEnum = layerEnum;
	}

	public void AddNote(Note note)
	{
		notes.Add(note);
		notesHashSet.Add(note);
	}

	public void RemoveNote(Note note)
	{
		notes.Remove(note);
		notesHashSet.Remove(note);
	}

	public bool ContainsNote(Note note)
	{
		return notesHashSet.Contains(note);
	}

	public List<Note> GetNotes()
	{
		return new List<Note>(notes);
	}

	public SongEditorEnumLayer CloneDeep()
	{
		SongEditorEnumLayer clone = new SongEditorEnumLayer(LayerEnum);
		clone.Color = base.Color;
		clone.IsVisible = base.IsVisible;
		notes.ForEach((Note note) =>
		{
			Note note2 = note.Clone();
			clone.AddNote(note2);
		});
		return clone;
	}

	public void ClearNotes()
	{
		notes.Clear();
	}

	public override string GetDisplayName()
	{
		return LayerEnum.ToString();
	}
}
