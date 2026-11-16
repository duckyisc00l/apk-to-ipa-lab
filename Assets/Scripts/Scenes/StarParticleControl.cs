using UniInject;
using UnityEngine;
using UnityEngine.UIElements;

public class StarParticleControl : INeedInjection
{
	private VisualElement visualElementToFollow;

	private float lastVisualElementToFollowPosition;

	private float rotation;

	[Inject(Key = "rootVisualElement")]
	public VisualElement VisualElement { get; private set; }

	public VisualElement VisualElementToFollow
	{
		get
		{
			return visualElementToFollow;
		}
		set
		{
			visualElementToFollow = value;
			lastVisualElementToFollowPosition = visualElementToFollow.style.left.value.value;
		}
	}

	public float Rotation
	{
		get
		{
			return rotation;
		}
		set
		{
			rotation = value;
			VisualElement.style.rotate = new StyleRotate(new Rotate(rotation));
		}
	}

	public float RotationVelocityInDegreesPerSecond { get; set; }

	public Vector2 VelocityInPercentPerSecond { get; set; }

	public void Update()
	{
		if (RotationVelocityInDegreesPerSecond != 0f)
		{
			Rotation += RotationVelocityInDegreesPerSecond * Time.deltaTime;
		}
		if (VelocityInPercentPerSecond.x != 0f || VelocityInPercentPerSecond.y != 0f)
		{
			Vector2 pos = new Vector2(VisualElement.style.left.value.value, VisualElement.style.top.value.value) + VelocityInPercentPerSecond * Time.deltaTime;
			SetPosition(pos);
		}
		FollowTargetVisualElement();
	}

	private void FollowTargetVisualElement()
	{
		if (visualElementToFollow != null)
		{
			float num = visualElementToFollow.style.left.value.value - lastVisualElementToFollowPosition;
			float value = VisualElement.style.left.value.value + num;
			VisualElement.style.left = new StyleLength(new Length(value, LengthUnit.Percent));
			lastVisualElementToFollowPosition = visualElementToFollow.style.left.value.value;
		}
	}

	public void SetPosition(Vector2 pos, LengthUnit lengthUnit = LengthUnit.Percent)
	{
		VisualElement.style.left = new StyleLength(new Length(pos.x, lengthUnit));
		VisualElement.style.top = new StyleLength(new Length(pos.y, lengthUnit));
	}

	public void SetScale(Vector2 scale)
	{
		VisualElement.style.scale = new StyleScale(new Scale(scale));
	}

	public void SetOpacity(float alpha)
	{
		VisualElement.style.opacity = alpha;
	}
}
