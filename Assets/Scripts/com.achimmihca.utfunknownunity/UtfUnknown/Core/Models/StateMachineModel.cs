namespace UtfUnknown.Core.Models
{
	public abstract class StateMachineModel
	{
		public const int START = 0;

		public const int ERROR = 1;

		public const int ITSME = 2;

		public BitPackage classTable;

		public BitPackage stateTable;

		public int[] charLenTable;

		public string Name { get; }

		public int ClassFactor { get; }

		public StateMachineModel(BitPackage classTable, int classFactor, BitPackage stateTable, int[] charLenTable, string name)
		{
			this.classTable = classTable;
			ClassFactor = classFactor;
			this.stateTable = stateTable;
			this.charLenTable = charLenTable;
			Name = name;
		}

		public int GetClass(byte b)
		{
			return classTable.Unpack(b);
		}
	}
}
