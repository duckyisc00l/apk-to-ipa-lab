using System;
using System.Collections.Generic;
using System.Globalization;
using UnityEngine;

[Serializable]
public class Voice : ISerializationCallbackReceiver
{
	public class VoiceComparerByName : IComparer<Voice>
	{
		public int Compare(Voice x, Voice y)
		{
			if (x == null && y == null)
			{
				return 0;
			}
			if (x == null)
			{
				return -1;
			}
			if (y == null)
			{
				return 1;
			}
			return string.Compare(x.Name, y.Name, ignoreCase: true, CultureInfo.InvariantCulture);
		}
	}

	public static readonly string soloVoiceName = "";

	public static readonly string firstVoiceName = "P1";

	public static readonly string secondVoiceName = "P2";

	public static readonly IComparer<Voice> comparerByName = new VoiceComparerByName();

	private readonly HashSet<Sentence> sentences = new HashSet<Sentence>();

	public string Name { get; private set; } = soloVoiceName;

	public IReadOnlyCollection<Sentence> Sentences => sentences;

	public Voice()
	{
	}

	public Voice(string name)
	{
		SetName(name);
	}

	public Voice(IEnumerable<Sentence> sentences, string name)
	{
		SetName(name);
		SetSentences(sentences);
	}

	public void SetSentences(IEnumerable<Sentence> newSentences)
	{
		if (newSentences == null)
		{
			throw new UnityException("Sentences cannot be null!");
		}
		foreach (Sentence item in new List<Sentence>(sentences))
		{
			RemoveSentence(item);
		}
		foreach (Sentence newSentence in newSentences)
		{
			AddSentence(newSentence);
		}
	}

	public void AddSentence(Sentence sentence)
	{
		if (sentence == null)
		{
			throw new UnityException("Sentence cannot be null");
		}
		if (!sentences.Contains(sentence))
		{
			sentences.Add(sentence);
			sentence.SetVoice(this);
		}
	}

	public void RemoveSentence(Sentence sentence)
	{
		if (sentence == null)
		{
			throw new UnityException("Sentence cannot be null");
		}
		if (sentences.Contains(sentence))
		{
			sentences.Remove(sentence);
			sentence.SetVoice(null);
		}
	}

	public void SetName(string name)
	{
		Name = name ?? throw new ArgumentNullException("name");
	}

	public void OnBeforeSerialize()
	{
	}

	public void OnAfterDeserialize()
	{
		foreach (Sentence sentence in sentences)
		{
			sentence.SetVoice(this);
		}
	}

	public Voice CloneDeep()
	{
		Voice voice = new Voice(Name);
		foreach (Sentence sentence2 in Sentences)
		{
			Sentence sentence = sentence2.CloneDeep();
			voice.AddSentence(sentence);
		}
		return voice;
	}

	public bool VoiceNameEquals(string otherVoiceName)
	{
		if (!(otherVoiceName == Name) && (!otherVoiceName.IsNullOrEmpty() || !Name.IsNullOrEmpty()))
		{
			if (otherVoiceName == firstVoiceName)
			{
				return Name == soloVoiceName;
			}
			return false;
		}
		return true;
	}

	public static string NormalizeVoiceName(string voiceName)
	{
		if (!voiceName.IsNullOrEmpty() && !(voiceName == soloVoiceName))
		{
			return voiceName;
		}
		return firstVoiceName;
	}
}
