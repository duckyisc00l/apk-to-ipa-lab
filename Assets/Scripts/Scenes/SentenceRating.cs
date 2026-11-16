using System.Collections.Generic;
using ProTrans;
using UnityEngine;

public class SentenceRating
{
	private const string SentenceRatingColorPerfect = "#3AFF4EAF";

	private const string SentenceRatingColorGreat = "#20CF327F";

	private const string SentenceRatingColorGood = "#E7B41C7F";

	private const string SentenceRatingColorNotBad = "#44ABDC7F";

	private const string SentenceRatingColorBad = "#961CE77F";

	public static readonly SentenceRating perfect = new SentenceRating(0.95, R.Messages.rating_sentence_perfect, "#3AFF4EAF");

	public static readonly SentenceRating great = new SentenceRating(0.75, R.Messages.rating_sentence_great, "#20CF327F");

	public static readonly SentenceRating good = new SentenceRating(0.5, R.Messages.rating_sentence_good, "#E7B41C7F");

	public static readonly SentenceRating notBad = new SentenceRating(0.25, R.Messages.rating_sentence_notBad, "#44ABDC7F");

	public static readonly SentenceRating bad = new SentenceRating(0.0, R.Messages.rating_sentence_bad, "#961CE77F");

	private readonly string i18nCode;

	private static List<SentenceRating> values;

	public double PercentageThreshold { get; private set; }

	public string Text => TranslationManager.GetTranslation(i18nCode);

	public Color BackgroundColor { get; private set; }

	public static List<SentenceRating> Values
	{
		get
		{
			if (values == null)
			{
				values = new List<SentenceRating>();
				values.Add(perfect);
				values.Add(great);
				values.Add(good);
				values.Add(notBad);
				values.Add(bad);
			}
			return values;
		}
	}

	private SentenceRating(double percentThreshold, string i18nCode, string hexBackgroundColor)
	{
		PercentageThreshold = percentThreshold;
		this.i18nCode = i18nCode;
		BackgroundColor = Colors.CreateColor(hexBackgroundColor);
	}

	public static SentenceRating GetSentenceRating(double correctNotesPercentage)
	{
		if (correctNotesPercentage < 0.0)
		{
			return null;
		}
		foreach (SentenceRating value in Values)
		{
			if (correctNotesPercentage >= value.PercentageThreshold)
			{
				return value;
			}
		}
		return null;
	}
}
