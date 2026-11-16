using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

namespace ProTrans
{
	[RequireComponent(typeof(Text))]
	[ExecuteInEditMode]
	public class TranslatedText : AbstractTranslatorBehaviour
	{
		[Delayed]
		public string key;

		private string lastKey;

		private Text uiText;

		public override void UpdateTranslation()
		{
			if (key == null)
			{
				Debug.LogWarning("Missing translation key for object '" + base.gameObject.name + "'", base.gameObject);
				return;
			}
			string value = key.Trim();
			if (string.IsNullOrEmpty(value))
			{
				Debug.LogWarning("Missing translation key for object '" + base.gameObject.name + "'", base.gameObject);
				return;
			}
			Dictionary<string, string> translationArguments = GetTranslationArguments();
			string translation = TranslationManager.GetTranslation(value, translationArguments);
			if (uiText == null)
			{
				uiText = GetComponent<Text>();
			}
			uiText.text = translation;
		}

		protected virtual Dictionary<string, string> GetTranslationArguments()
		{
			return null;
		}
	}
}
