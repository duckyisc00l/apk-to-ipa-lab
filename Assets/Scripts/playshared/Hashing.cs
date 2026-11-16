using System.Security.Cryptography;
using System.Text;

public static class Hashing
{
	public static uint Fnv1A(byte[] input)
	{
		uint num = 2166136261u;
		for (int i = 0; i < input.Length; i++)
		{
			num = (num * 16777619) ^ input[i];
		}
		return num;
	}

	public static string Md5(byte[] input)
	{
		byte[] array = new MD5CryptoServiceProvider().ComputeHash(input);
		StringBuilder stringBuilder = new StringBuilder(array.Length * 2);
		for (int i = 0; i < array.Length; i++)
		{
			stringBuilder.Append(array[i].ToString("x2"));
		}
		return stringBuilder.ToString();
	}
}
