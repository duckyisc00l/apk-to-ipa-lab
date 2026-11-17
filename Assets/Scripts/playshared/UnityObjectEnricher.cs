using UnityEngine;

public class UnityObjectEnricher : ScalarValueEnricher
{
	public static readonly string unityObjectPropertyName = "unityObject";

	public UnityObjectEnricher(Object value)
		: base(unityObjectPropertyName, value)
	{
	}
}
