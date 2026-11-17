using UnityEngine;
using UnityEngine.UI;

namespace ShootAR.Menu
{
	public class RoundSelectMenu : MonoBehaviour
	{
		private int roundToPlay;

		[SerializeField]
		private Text labelOnUI;

		public int RoundToPlay
		{
			get { return roundToPlay; }
			internal set
			{
				roundToPlay = Mathf.Max(1, value);   // rounds start at 1
				if (labelOnUI != null) labelOnUI.text = roundToPlay.ToString();
			}
		}

		private void OnEnable()
		{
			RoundToPlay = Configuration.StartingLevel > 0 ? Configuration.StartingLevel : 1;
		}
	}
}
