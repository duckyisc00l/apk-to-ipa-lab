using System;
using System.Collections.Generic;
using System.Threading;
using UnityEngine;

public static class ThreadPool
{
	public class PoolHandle
	{
		public bool done;
	}

	private static readonly Queue<(Action<PoolHandle>, PoolHandle)> queue;

	private static int waiterCount;

	private static readonly EventWaitHandle waitHandle;

	static ThreadPool()
	{
		queue = new Queue<(Action<PoolHandle>, PoolHandle)>();
		waiterCount = Mathf.Max(SystemInfo.processorCount - 1, 1);
		waitHandle = new EventWaitHandle(initialState: false, EventResetMode.AutoReset);
		for (int i = 0; i < waiterCount; i++)
		{
			Thread thread = new Thread(ThreadProc);
			thread.IsBackground = true;
			thread.Start();
		}
	}

	public static PoolHandle QueueUserWorkItem(Action<PoolHandle> callBack)
	{
		if (callBack == null)
		{
			throw new ArgumentNullException("callBack");
		}
		PoolHandle poolHandle = new PoolHandle();
		lock (queue)
		{
			queue.Enqueue((callBack, poolHandle));
		}
		if (waiterCount > 0)
		{
			waitHandle.Set();
		}
		return poolHandle;
	}

	private static void ThreadProc()
	{
		while (true)
		{
			waitHandle.WaitOne();
			Interlocked.Decrement(ref waiterCount);
			while (true)
			{
				(Action<PoolHandle>, PoolHandle) tuple;
				lock (queue)
				{
					if (queue.Count == 0)
					{
						break;
					}
					tuple = queue.Dequeue();
					goto IL_004b;
				}
				IL_004b:
				tuple.Item1(tuple.Item2);
			}
			Interlocked.Increment(ref waiterCount);
		}
	}
}
