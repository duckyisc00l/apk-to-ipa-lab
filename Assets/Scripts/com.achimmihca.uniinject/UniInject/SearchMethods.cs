namespace UniInject
{
	public enum SearchMethods
	{
		SearchInBindings = 0,
		GetComponent = 1,
		GetComponentInChildren = 2,
		GetComponentInChildrenIncludeInactive = 3,
		GetComponentsInChildren = 4,
		GetComponentsInChildrenIncludeInactive = 5,
		GetComponentInParent = 6,
		GetComponentInParentIncludeInactive = 7,
		GetComponentsInParent = 8,
		GetComponentsInParentIncludeInactive = 9,
		FindObjectOfType = 10,
		FindObjectOfTypeIncludeInactive = 11,
		FindObjectsOfType = 12,
		FindObjectsOfTypeIncludeInactive = 13
	}
}
