using System.ComponentModel;
using UnityEngine;
using UnityEngine.InputSystem;
using UnityEngine.Scripting;

[Preserve]
[DisplayName("Repeated Hold")]
public class RepeatedHoldInteraction : IInputInteraction
{
	private static readonly float defaultButtonPressPoint;

	public bool fireImmediately = true;

	public float initialPause = 0.5f;

	public float repeatedPause = 0.2f;

	public float pressPoint = 0.5f;

	private float ignoreInputUntilTime;

	private float InitialPauseOrDefault
	{
		get
		{
			if (!((double)initialPause > 0.0))
			{
				return InputSystem.settings.defaultHoldTime;
			}
			return initialPause;
		}
	}

	private float RepeatedPauseOrDefault
	{
		get
		{
			if (!((double)repeatedPause > 0.0))
			{
				return InputSystem.settings.defaultHoldTime;
			}
			return repeatedPause;
		}
	}

	private float PressPointOrDefault
	{
		get
		{
			if (!((double)pressPoint > 0.0))
			{
				return defaultButtonPressPoint;
			}
			return pressPoint;
		}
	}

	[RuntimeInitializeOnLoadMethod(RuntimeInitializeLoadType.AfterAssembliesLoaded)]
	private static void Init()
	{
	}

	static RepeatedHoldInteraction()
	{
		defaultButtonPressPoint = 0.5f;
		InputSystem.RegisterInteraction<RepeatedHoldInteraction>();
	}

	public void Process(ref InputInteractionContext context)
	{
		switch (context.phase)
		{
		case InputActionPhase.Waiting:
		case InputActionPhase.Canceled:
			if (context.ControlIsActuated(PressPointOrDefault) && Time.time >= ignoreInputUntilTime - 0.1f)
			{
				context.Started();
				if (fireImmediately)
				{
					context.PerformedAndStayStarted();
				}
				ignoreInputUntilTime = Time.time + InitialPauseOrDefault;
				context.SetTimeout(InitialPauseOrDefault);
			}
			break;
		case InputActionPhase.Started:
			if (!context.ControlIsActuated())
			{
				Cancel(ref context);
			}
			else if (Time.time >= ignoreInputUntilTime - 0.1f)
			{
				context.PerformedAndStayStarted();
				ignoreInputUntilTime = Time.time + RepeatedPauseOrDefault;
				context.SetTimeout(RepeatedPauseOrDefault);
			}
			break;
		case InputActionPhase.Performed:
			if (!context.ControlIsActuated(PressPointOrDefault))
			{
				Cancel(ref context);
			}
			break;
		default:
			if (!context.ControlIsActuated(PressPointOrDefault))
			{
				Cancel(ref context);
			}
			break;
		}
	}

	private void Cancel(ref InputInteractionContext context)
	{
		ignoreInputUntilTime = 0f;
		context.Canceled();
	}

	public void Reset()
	{
	}
}
