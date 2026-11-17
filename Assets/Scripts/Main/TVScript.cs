using ShootAR;
using UnityEngine;

// A TV in the scene: shows static while a round is on, goes black when it's over.
public class TVScript : MonoBehaviour
{
	[SerializeField] private Material blackScreen;
	[SerializeField] private Material staticScreen;
	private int tvRefreshTime;
	public bool tvOn;
	private GameState gameState;
	private Renderer screen;

	private void Start()
	{
		screen = GetComponent<Renderer>();
		gameState = FindObjectOfType<GameState>();
		if (gameState != null) { gameState.OnGameOver += CloseTV; gameState.OnRoundWon += CloseTV; }
		if (tvOn) StartTV(); else CloseTV();
	}

	private void Update()
	{
		if (!tvOn || screen == null || staticScreen == null) return;
		if (++tvRefreshTime % 3 == 0)   // flicker the static
			screen.material.mainTextureOffset = new Vector2(Random.value, Random.value);
	}

	public void CloseTV() { tvOn = false; if (screen != null && blackScreen != null) screen.material = blackScreen; }
	public void StartTV() { tvOn = true; if (screen != null && staticScreen != null) screen.material = staticScreen; }
}
