using UnityEngine.UIElements;

public static class UIDocumentUtils
{
	public static UIDocument FindUIDocumentOrThrow()
	{
		UIDocument uIDocument = GameObjectUtils.FindComponentWithTag<UIDocument>("UIDocument");
		if (uIDocument == null)
		{
			throw new UltraStarPlayException("No UIDocument found");
		}
		return uIDocument;
	}
}
