using System;
using UniInject;
using UnityEngine;
using UnityEngine.UIElements;

public class CreditsCharacterControl : INeedInjection, IDisposable
{
	private static readonly Vector2 gravityInPxPerSecond = new Vector2(0f, 300f);

	[Inject(UxmlName = "allCharactersContainer")]
	private VisualElement allCharactersContainer;

	[Inject]
	private GameObject gameObject;

	private float lifeTime;

	private Vector2 velocityInPxPerSecond;

	private float angleVelocityInDegrees;

	private float startMovementTimeInSeconds;

	[Inject(Key = "rootVisualElement")]
	public Label Label { get; private set; }

	public VisualElement VisualElement => Label;

	public bool IsMoving { get; private set; }

	public bool IsCollected { get; set; }

	public string Character
	{
		get
		{
			return Label.text;
		}
		set
		{
			Label.text = value;
		}
	}

	public void InitMovement()
	{
		startMovementTimeInSeconds = UnityEngine.Random.Range(1.5f, 3f);
	}

	public void Update()
	{
		if (lifeTime > startMovementTimeInSeconds)
		{
			if (!IsMoving)
			{
				IsMoving = true;
				velocityInPxPerSecond = new Vector2(UnityEngine.Random.Range(-150, 150), UnityEngine.Random.Range(-360, -200));
				angleVelocityInDegrees = UnityEngine.Random.Range(0, 720 / Application.targetFrameRate);
			}
			velocityInPxPerSecond += gravityInPxPerSecond * Time.deltaTime;
			Label.style.left = Label.style.left.value.value + velocityInPxPerSecond.x * Time.deltaTime;
			Label.style.top = Label.style.top.value.value + velocityInPxPerSecond.y * Time.deltaTime;
			Label.style.rotate = new StyleRotate(new Rotate(new Angle(Label.style.rotate.value.angle.value + angleVelocityInDegrees, AngleUnit.Degree)));
		}
		if (startMovementTimeInSeconds > 0f)
		{
			lifeTime += Time.deltaTime;
		}
	}

	public void Dispose()
	{
		Label.RemoveFromHierarchy();
	}
}
