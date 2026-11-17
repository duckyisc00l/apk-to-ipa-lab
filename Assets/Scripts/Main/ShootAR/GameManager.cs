using System;
using System.Collections;
using System.Collections.Generic;
using ShootAR.Enemies;
using UnityEngine;
using UnityEngine.SceneManagement;
using UnityEngine.UI;

namespace ShootAR
{
	// Runs the rounds: shows the phone's camera behind the game, starts the spawners for each round,
	// wins the round when every spawner is done and no enemy is left, loses when health hits 0.
	public class GameManager : MonoBehaviour
	{
		[SerializeField] private AudioClip victoryMusic;
		private Dictionary<Type, Spawner> spawner;
		[SerializeField] private ScoreManager scoreManager;
		[Obsolete] private bool exitTap;
		private AudioSource audioPlayer;
		[SerializeField] private GameState gameState;
		[SerializeField] private Button fireButton;
		[SerializeField] private UIManager ui;
		private WebCamTexture cam;
		[SerializeField] private RawImage backgroundTexture;
		[SerializeField] private Player player;
		private const int CAPSULE_BONUS_POINTS = 50;
		private bool advancing;

		public static GameManager Create(Player player, GameState gameState, ScoreManager scoreManager = null, AudioClip victoryMusic = null, AudioSource sfx = null, Button fireButton = null, RawImage background = null, UIManager ui = null)
		{
			var g = new GameObject("GameManager").AddComponent<GameManager>();
			g.player = player; g.gameState = gameState; g.scoreManager = scoreManager; g.victoryMusic = victoryMusic;
			g.audioPlayer = sfx; g.fireButton = fireButton; g.backgroundTexture = background; g.ui = ui;
			return g;
		}

		private void Awake()
		{
			if (audioPlayer == null) audioPlayer = GetComponent<AudioSource>();
			if (audioPlayer == null) audioPlayer = gameObject.AddComponent<AudioSource>();
			spawner = new Dictionary<Type, Spawner>();
			foreach (var s in FindObjectsOfType<Spawner>())
				if (s.ObjectToSpawn != null) spawner[s.ObjectToSpawn.GetType()] = s;
		}

		private void Start()
		{
			Time.timeScale = 1f;
			Enemy.ClearingScene = false;
			AudioListener.volume = Configuration.SoundMuted ? 0f : 1f;
			if (WebCamTexture.devices.Length > 0 && backgroundTexture != null)   // the "AR": camera feed behind the game
			{
				cam = new WebCamTexture(WebCamTexture.devices[0].name, Screen.width, Screen.height);
				backgroundTexture.texture = cam;
				cam.Play();
			}
			if (gameState != null)
			{
				gameState.OnGameOver += OnGameOver;
				gameState.OnRoundWon += OnRoundWon;
				gameState.Level = Mathf.Max(1, Configuration.StartingLevel) - 1;   // AdvanceLevel adds one
			}
			if (fireButton != null && player != null) fireButton.onClick.AddListener(() => player.Shoot());
			AdvanceLevel();
		}

		private void FixedUpdate()
		{
			if (gameState == null || gameState.GameOver || gameState.RoundWon || advancing) return;
			foreach (var s in spawner.Values)
				if (s.IsSpawning && !(s.ObjectToSpawn is Capsule)) return;
			if (Enemy.ActiveCount <= 0) gameState.RoundWon = true;
		}

		private void OnDisable() { if (cam != null) cam.Stop(); }
		private void OnDestroy() { if (cam != null) cam.Stop(); Enemy.ClearingScene = true; }
		private void OnApplicationQuit() { Enemy.ClearingScene = true; }

		// Round N: more and faster enemies; drones join from round 2. Capsules come along each round.
		private void AdvanceLevel()
		{
			advancing = false;
			gameState.RoundWon = false;
			gameState.Level++;
			if (ui != null)
			{
				if (ui.RoundIndex != null) ui.RoundIndex.text = "Round " + gameState.Level;
				if (ui.MessageOnScreen != null) ui.MessageOnScreen.text = "Round " + gameState.Level;
			}
			StartCoroutine(HideMessage(2f));
			int level = gameState.Level;
			foreach (var kv in spawner)
			{
				if (kv.Key == typeof(Crasher)) kv.Value.StartSpawning(4 + 2 * level, Mathf.Max(0.8f, 3f - 0.2f * level), 3f);
				else if (kv.Key == typeof(Drone)) { if (level >= 2) kv.Value.StartSpawning(level - 1 + level / 3, Mathf.Max(2f, 6f - 0.3f * level), 6f); }
				else if (kv.Key == typeof(Capsule)) kv.Value.StartSpawning(1 + level / 3, 12f, 8f);
				else kv.Value.StartSpawning(level, 4f, 4f);
			}
			if (player != null) player.CanShoot = true;
		}

		private IEnumerator HideMessage(float after)
		{
			yield return new WaitForSeconds(after);
			if (ui != null && ui.MessageOnScreen != null && !gameState.GameOver) ui.MessageOnScreen.text = "";
		}

		private void ClearScene()
		{
			foreach (var s in spawner.Values) s.StopSpawning();
			foreach (var e in FindObjectsOfType<Spawnable>())
			{
				var enemy = e as Enemy;
				if (enemy != null) enemy.Remove(); else Destroy(e.gameObject);
			}
		}

		public void GoToMenu()
		{
			Time.timeScale = 1f;
			SceneManager.LoadScene(0);
		}

		private void OnGameOver()
		{
			if (player != null) player.CanShoot = false;
			ClearScene();
			if (ui != null && ui.MessageOnScreen != null)
				ui.MessageOnScreen.text = "Game Over\nScore: " + (scoreManager != null ? scoreManager.Score : 0);
			Invoke(nameof(GoToMenu), 5f);
		}

		private void OnRoundWon()
		{
			advancing = true;
			ClearScene();
			if (ui != null && ui.MessageOnScreen != null) ui.MessageOnScreen.text = "Round Cleared!";
			if (victoryMusic != null) audioPlayer.PlayOneShot(victoryMusic);
			Invoke(nameof(AdvanceLevel), 4f);
		}
	}
}
