using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Runtime.CompilerServices;

namespace MiScaleExporter.MAUI.ViewModels;

public class BaseViewModel : INotifyPropertyChanged
{
	private bool isBusy;

	private string title = string.Empty;

	public bool IsBusy
	{
		get
		{
			return isBusy;
		}
		set
		{
			SetProperty(ref isBusy, value, "IsBusy");
		}
	}

	public string Title
	{
		get
		{
			return title;
		}
		set
		{
			SetProperty(ref title, value, "Title");
		}
	}

	public event PropertyChangedEventHandler PropertyChanged;

	protected bool SetProperty<T>(ref T backingStore, T value, [CallerMemberName] string propertyName = "", Action onChanged = null)
	{
		if (EqualityComparer<T>.Default.Equals(backingStore, value))
		{
			return false;
		}
		backingStore = value;
		onChanged?.Invoke();
		OnPropertyChanged(propertyName);
		return true;
	}

	protected void OnPropertyChanged([CallerMemberName] string propertyName = "")
	{
		PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propertyName));
	}

	protected void NotifyAllPropertiesChanged()
	{
		PropertyChanged(this, new PropertyChangedEventArgs(null));
	}
}
