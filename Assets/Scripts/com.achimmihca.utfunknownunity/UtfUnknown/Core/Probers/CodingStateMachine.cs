using UtfUnknown.Core.Models;

namespace UtfUnknown.Core.Probers
{
	public class CodingStateMachine
	{
		private int currentState;

		private StateMachineModel model;

		private int currentCharLen;

		public int CurrentCharLen => currentCharLen;

		public string ModelName => model.Name;

		public CodingStateMachine(StateMachineModel model)
		{
			currentState = 0;
			this.model = model;
		}

		public int NextState(byte b)
		{
			int num = model.GetClass(b);
			if (currentState == 0)
			{
				currentCharLen = model.charLenTable[num];
			}
			currentState = model.stateTable.Unpack(currentState * model.ClassFactor + num);
			return currentState;
		}

		public void Reset()
		{
			currentState = 0;
		}
	}
}
