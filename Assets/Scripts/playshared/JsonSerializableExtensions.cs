public static class JsonSerializableExtensions
{
	public static string ToJson(this JsonSerializable jsonSerializable)
	{
		return JsonConverter.ToJson(jsonSerializable);
	}
}
