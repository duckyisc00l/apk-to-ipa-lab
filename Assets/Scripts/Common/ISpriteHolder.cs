using System.Collections.Generic;
using UnityEngine;

public interface ISpriteHolder
{
	IReadOnlyCollection<Sprite> GetSprites();
}
