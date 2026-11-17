using ProTrans;
using UniInject;
using UnityEngine;

public class UltraStarPlayTranslationManager : TranslationManager, INeedInjection
{
	[Inject]
	private Injector injector;

	public override void UpdateTranslatorsInScene()
	{
		if (Application.isPlaying)
		{
			UltraStarPlaySceneInjectionManager ultraStarPlaySceneInjectionManager = UltraStarPlaySceneInjectionManager.Instance;
			if (ultraStarPlaySceneInjectionManager.SceneInjectionStatus == ESceneInjectionStatus.Pending)
			{
				ultraStarPlaySceneInjectionManager.DoSceneInjection();
			}
			base.UpdateTranslatorsInScene();
		}
	}
}
