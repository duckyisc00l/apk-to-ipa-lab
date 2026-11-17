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
			var s = new GameObject("ScoreManager").AddComponent<ScoreManager>();
			s.scoreLabel = scoreLabel;
			s.Score = score;
			return s;
		}

		private void Start() { UpdateLabel(); }

		public void AddScore(int points)
		{
			Score += points;
			UpdateLabel();
		}

		private void UpdateLabel()
		{
			if (scoreLabel != null) scoreLabel.text = Score.ToString();
		}
	}
}
