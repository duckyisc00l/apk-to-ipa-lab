using System;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

namespace ShootAR
{
	public class GameManager : MonoBehaviour
	{
		[SerializeField]
		private AudioClip victoryMusic;

		private Dictionary<Type, Spawner> spawner;

		[SerializeField]
		private ScoreManager scoreManager;

		[Obsolete]
		private bool exitTap;

		private AudioSource audioPlayer;

		[SerializeField]
		private GameState gameState;

		[SerializeField]
		private Button fireButton;

		[SerializeField]
		private UIManager ui;

		private WebCamTexture cam;

		[SerializeField]
		private RawImage backgroundTexture;

		[SerializeField]
		private Player player;

		private const int CAPSULE_BONUS_POINTS = 50;

		public static GameManager Create(Player player, GameState gameState, ScoreManager scoreManager = null, AudioClip victoryMusic = null, AudioSource sfx = null, Button fireButton = null, RawImage background = null, UIManager ui = null)
		{
			return null;
		}

		private void Awake()
		{
		}

		private void Start()
		{
		}

		private void FixedUpdate()
		{
		}

		private void OnDisable()
		{
		}

		private void OnDestroy()
		{
		}

		private void OnApplicationQuit()
		{
		}

		private void AdvanceLevel()
		{
		}

		private void ClearScene()
		{
		}

		public void GoToMenu()
		{
		}

		private void OnGameOver()
		{
		}

		private void OnRoundWon()
		{
		}
	}
}
