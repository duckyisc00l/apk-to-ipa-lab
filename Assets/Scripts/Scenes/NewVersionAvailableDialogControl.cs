using System;
using System.Collections.Generic;
using ProTrans;
using UniInject;
using UnityEngine.UIElements;

public class NewVersionAvailableDialogControl : AbstractDialogControl, IInjectionFinishedListener, ITranslator
{
	[Inject(UxmlName = "dialogTitle")]
	private Label dialogTitle;

	[Inject(UxmlName = "dialogMessage")]
	private Label dialogMessage;

	[Inject(UxmlName = "dialogCloseButton")]
	private Button closeButton;

	[Inject(UxmlName = "ignoreThisVersionButton")]
	private Button ignoreThisVersionButton;

	[Inject(UxmlName = "ignoreAllFutureVersionsButton")]
	private Button ignoreAllFutureVersionsButton;

	[Inject]
	private Settings settings;

	private readonly string remoteRelease;

	private readonly string websiteLink;

	private readonly string releaseName;

	private readonly VisualElement parentVisualElement;

	private readonly List<IDisposable> disposables = new List<IDisposable>();

	public NewVersionAvailableDialogControl(VisualElement dialogRootVisualElement, VisualElement parentVisualElement, Dictionary<string, string> remoteVersionProperties)
	{
		base.dialogRootVisualElement = dialogRootVisualElement;
		this.parentVisualElement = parentVisualElement;
		remoteVersionProperties.TryGetValue("release", out remoteRelease);
		remoteVersionProperties.TryGetValue("name", out releaseName);
		remoteVersionProperties.TryGetValue("website_link", out websiteLink);
	}

	public void OnInjectionFinished()
	{
		ignoreThisVersionButton.RegisterCallbackButtonTriggered(() =>
		{
			settings.IgnoredReleases.AddIfNotContains(remoteRelease);
			CloseDialog();
		});
		ignoreAllFutureVersionsButton.RegisterCallbackButtonTriggered(() =>
		{
			settings.IgnoredReleases.Clear();
			settings.IgnoredReleases.Add("all");
			CloseDialog();
		});
		closeButton.RegisterCallbackButtonTriggered(() =>
		{
			CloseDialog();
		});
		UpdateTranslation();
		parentVisualElement.Add(dialogRootVisualElement);
		closeButton.Focus();
	}

	public override void CloseDialog()
	{
		base.CloseDialog();
		disposables.ForEach((IDisposable it) =>
		{
			it.Dispose();
		});
	}

	public void UpdateTranslation()
	{
		string text = (releaseName.IsNullOrEmpty() ? remoteRelease.NullToEmpty() : releaseName.NullToEmpty());
		dialogMessage.text = TranslationManager.GetTranslation(R.Messages.newVersionAvailableDialog_message, "remoteRelease", text, "websiteLink", websiteLink.NullToEmpty());
		dialogTitle.text = TranslationManager.GetTranslation(R.Messages.newVersionAvailableDialog_title);
		ignoreThisVersionButton.text = TranslationManager.GetTranslation(R.Messages.newVersionAvailableDialog_ignoreThisVersion);
		ignoreAllFutureVersionsButton.text = TranslationManager.GetTranslation(R.Messages.newVersionAvailableDialog_ignoreAllFutureVersions);
	}
}
