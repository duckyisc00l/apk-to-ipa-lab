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
			get
			{
				return 0;
			}
			internal set
			{
			}
		}

		private void OnEnable()
		{
		}
	}
}
