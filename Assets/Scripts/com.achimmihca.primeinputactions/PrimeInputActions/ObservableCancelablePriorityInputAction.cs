using System;
using System.Collections.Generic;
using System.Linq;
using UniRx;
using UniRx.Triggers;
using UnityEngine;
using UnityEngine.InputSystem;

namespace PrimeInputActions
{
	public class ObservableCancelablePriorityInputAction
	{
		private class InputActionSubscriber
		{
			public int Priority { get; private set; }

			public Action<InputAction.CallbackContext> OnNext { get; private set; }

			public InputActionSubscriber(int priority, Action<InputAction.CallbackContext> onNext)
			{
				Priority = priority;
				OnNext = onNext;
			}
		}

		private int notifyCancelledInFrame;

		private List<InputActionSubscriber> performedSubscribers;

		private List<InputActionSubscriber> startedSubscribers;

		private List<InputActionSubscriber> canceledSubscribers;

		public GameObject Owner { get; private set; }

		public InputAction InputAction { get; private set; }

		public bool triggered => InputAction.triggered;

		public bool enabled => InputAction.enabled;

		public TValue ReadValue<TValue>() where TValue : struct
		{
			return InputAction.ReadValue<TValue>();
		}

		public object ReadValueAsObject()
		{
			return InputAction.ReadValueAsObject();
		}

		public ObservableCancelablePriorityInputAction(InputAction inputAction, GameObject owner)
		{
			InputAction = inputAction;
			Owner = owner;
		}

		public IObservable<InputAction.CallbackContext> StartedAsObservable(int priority = 0)
		{
			return Observable.FromEvent<InputAction.CallbackContext>(OnAddSubscriber, OnRemoveSubscriber);
			void OnAddSubscriber(Action<InputAction.CallbackContext> onNext)
			{
				if (startedSubscribers == null)
				{
					startedSubscribers = new List<InputActionSubscriber>();
					InputAction.started += NotifyStartedSubscribers;
					if (Owner != null)
					{
						Owner.OnDestroyAsObservable().Subscribe((Unit _) =>
						{
							InputAction.started -= NotifyStartedSubscribers;
						});
					}
				}
				startedSubscribers.Add(new InputActionSubscriber(priority, onNext));
				startedSubscribers.Sort(CompareByPriority);
			}
			void OnRemoveSubscriber(Action<InputAction.CallbackContext> onNext)
			{
				InputActionSubscriber item = startedSubscribers.FirstOrDefault((InputActionSubscriber it) => it.Priority == priority && it.OnNext == onNext);
				startedSubscribers.Remove(item);
				if (startedSubscribers.Count == 0)
				{
					InputAction.started -= NotifyStartedSubscribers;
					startedSubscribers = null;
				}
			}
		}

		public IObservable<InputAction.CallbackContext> PerformedAsObservable(int priority = 0)
		{
			return Observable.FromEvent<InputAction.CallbackContext>(OnAddSubscriber, OnRemoveSubscriber);
			void OnAddSubscriber(Action<InputAction.CallbackContext> onNext)
			{
				if (performedSubscribers == null)
				{
					performedSubscribers = new List<InputActionSubscriber>();
					InputAction.performed += NotifyPerformedSubscribers;
					if (Owner != null)
					{
						Owner.OnDestroyAsObservable().Subscribe((Unit _) =>
						{
							InputAction.performed -= NotifyPerformedSubscribers;
						});
					}
				}
				performedSubscribers.Add(new InputActionSubscriber(priority, onNext));
				performedSubscribers.Sort(CompareByPriority);
			}
			void OnRemoveSubscriber(Action<InputAction.CallbackContext> onNext)
			{
				InputActionSubscriber item = performedSubscribers.FirstOrDefault((InputActionSubscriber it) => it.Priority == priority && it.OnNext == onNext);
				performedSubscribers.Remove(item);
				if (performedSubscribers.Count == 0)
				{
					InputAction.performed -= NotifyPerformedSubscribers;
					performedSubscribers = null;
				}
			}
		}

		public IObservable<InputAction.CallbackContext> CanceledAsObservable(int priority = 0)
		{
			return Observable.FromEvent<InputAction.CallbackContext>(OnAddSubscriber, OnRemoveSubscriber);
			void OnAddSubscriber(Action<InputAction.CallbackContext> onNext)
			{
				if (canceledSubscribers == null)
				{
					canceledSubscribers = new List<InputActionSubscriber>();
					InputAction.canceled += NotifyCanceledSubscribers;
					if (Owner != null)
					{
						Owner.OnDestroyAsObservable().Subscribe((Unit _) =>
						{
							InputAction.canceled -= NotifyCanceledSubscribers;
						});
					}
				}
				canceledSubscribers.Add(new InputActionSubscriber(priority, onNext));
				canceledSubscribers.Sort(CompareByPriority);
			}
			void OnRemoveSubscriber(Action<InputAction.CallbackContext> onNext)
			{
				InputActionSubscriber item = canceledSubscribers.FirstOrDefault((InputActionSubscriber it) => it.Priority == priority && it.OnNext == onNext);
				canceledSubscribers.Remove(item);
				if (canceledSubscribers.Count == 0)
				{
					InputAction.canceled -= NotifyCanceledSubscribers;
					canceledSubscribers = null;
				}
			}
		}

		public void CancelNotifyForThisFrame()
		{
			notifyCancelledInFrame = Time.frameCount;
		}

		private void NotifyStartedSubscribers(InputAction.CallbackContext callbackContext)
		{
			int num = 0;
			while (startedSubscribers != null && num < startedSubscribers.Count && notifyCancelledInFrame != Time.frameCount)
			{
				startedSubscribers[num].OnNext(callbackContext);
				num++;
			}
		}

		private void NotifyPerformedSubscribers(InputAction.CallbackContext callbackContext)
		{
			int num = 0;
			while (performedSubscribers != null && num < performedSubscribers.Count && notifyCancelledInFrame != Time.frameCount)
			{
				performedSubscribers[num].OnNext(callbackContext);
				num++;
			}
		}

		private void NotifyCanceledSubscribers(InputAction.CallbackContext callbackContext)
		{
			int num = 0;
			while (canceledSubscribers != null && num < canceledSubscribers.Count && notifyCancelledInFrame != Time.frameCount)
			{
				canceledSubscribers[num].OnNext(callbackContext);
				num++;
			}
		}

		private int CompareByPriority(InputActionSubscriber a, InputActionSubscriber b)
		{
			return b.Priority.CompareTo(a.Priority);
		}

		public bool HasAnySubscribers()
		{
			if (!HasStartedSubscribers() && !HasPerformedSubscribers())
			{
				return HasCanceledSubscribers();
			}
			return true;
		}

		public bool HasStartedSubscribers()
		{
			return !startedSubscribers.IsNullOrEmpty();
		}

		public bool HasPerformedSubscribers()
		{
			return !performedSubscribers.IsNullOrEmpty();
		}

		public bool HasCanceledSubscribers()
		{
			return !canceledSubscribers.IsNullOrEmpty();
		}
	}
}
