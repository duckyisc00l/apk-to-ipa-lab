public class SongEditorVoiceLayer : AbstractSongEditorLayer
{
	public string VoiceName { get; private set; }

	public SongEditorVoiceLayer(string voiceName)
	{
		VoiceName = voiceName;
	}

	public override string GetDisplayName()
	{
		return VoiceName.Replace("P", "Player ");
	}
}
