using UnityEngine;

namespace UniRx
{
	public static class FrameCountTypeExtensions
	{
		public static YieldInstruction GetYieldInstruction(this FrameCountType frameCountType)
		{
			return frameCountType switch
			{
				FrameCountType.FixedUpdate => YieldInstructionCache.WaitForFixedUpdate, 
				FrameCountType.EndOfFrame => YieldInstructionCache.WaitForEndOfFrame, 
				_ => null, 
			};
		}
	}
}
