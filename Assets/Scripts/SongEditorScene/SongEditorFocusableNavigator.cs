using System.Linq;
using UnityEngine;

public class SongEditorFocusableNavigator : FocusableNavigator
{
	private void Awake()
	{
		(from it in Object.FindObjectsOfType<FocusableNavigator>()
			where it != this
			select it).ForEach((FocusableNavigator it) =>
		{
			it.gameObject.SetActive(value: false);
		});
	}
}
