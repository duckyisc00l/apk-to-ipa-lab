using UnityEngine;
using UnityEngine.UI;

namespace ShootAR
{
	public class ScoreManager : MonoBehaviour
	{
		[SerializeField]
		private Text scoreLabel;

		public int Score { get; private set; }

		public static ScoreManager Create(Text scoreLabel = null, int score = 0)
		{
			return null;
		}

		private void Start()
		{
		}

		public void AddScore(int points)
		{
		}
	}
}
