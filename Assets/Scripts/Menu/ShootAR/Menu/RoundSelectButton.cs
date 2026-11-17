using UnityEngine;
using UnityEngine.UI;

namespace ShootAR.Menu
{
	// The buttons are named "+1", "-1", "+10", "-10": the name is the step.
	public class RoundSelectButton : MonoBehaviour
	{
		private int numberOnLabel;

		[SerializeField]
		private RoundSelectMenu menu;

		private void Start()
		{
			int.TryParse(gameObject.name.Replace("+", ""), out numberOnLabel);
			var button = GetComponent<Button>();
			if (button != null)
				button.onClick.AddListener(() => menu.RoundToPlay += numberOnLabel);
		}
	}
}
