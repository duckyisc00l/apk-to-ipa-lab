using System.Collections.Generic;
using System.IO;

namespace CSharpSynth.Banks
{
	public static class BankManager
	{
		private static List<InstrumentBank> _banks = new List<InstrumentBank>();

		public const int DEFAULT_BANK_SIZE = 256;

		public const int DEFAULT_DRUMBANK_SIZE = 128;

		public static int Count => _banks.Count;

		public static List<InstrumentBank> Banks => _banks;

		public static void addBank(InstrumentBank bank)
		{
			_banks.Add(bank);
		}

		public static void removeBank(int index)
		{
			_banks[index].Clear();
			_banks.RemoveAt(index);
		}

		public static void removeBank(InstrumentBank bank)
		{
			int num = _banks.IndexOf(bank);
			if (num > -1)
			{
				removeBank(num);
			}
		}

		public static void removeBank(string bankname)
		{
			InstrumentBank bank = getBank(bankname);
			if (bank != null)
			{
				removeBank(bank);
			}
		}

		public static int getBankIndex(string bankname)
		{
			bankname = Path.GetFileName(bankname).ToLower();
			for (int i = 0; i < _banks.Count; i++)
			{
				if (Path.GetFileName(_banks[i].BankPath).ToLower().Equals(bankname))
				{
					return i;
				}
			}
			return -1;
		}

		public static int getBankIndex(InstrumentBank bank)
		{
			return _banks.IndexOf(bank);
		}

		public static InstrumentBank getBank(int index)
		{
			return _banks[index];
		}

		public static InstrumentBank getBank(string bankname)
		{
			int bankIndex = getBankIndex(bankname);
			if (bankIndex > -1)
			{
				return _banks[bankIndex];
			}
			return null;
		}

		public static void Clear()
		{
			for (int i = 0; i < _banks.Count; i++)
			{
				_banks[i].Clear();
			}
			_banks.Clear();
		}
	}
}
