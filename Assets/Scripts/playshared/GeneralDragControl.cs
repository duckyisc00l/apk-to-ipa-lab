public class GeneralDragControl : AbstractDragControl<GeneralDragEvent>
{
	protected override GeneralDragEvent CreateDragEventStart(DragControlPointerEvent eventData)
	{
		return CreateGeneralDragEventStart(eventData);
	}

	protected override GeneralDragEvent CreateDragEvent(DragControlPointerEvent eventData, GeneralDragEvent dragStartEvent)
	{
		return CreateGeneralDragEvent(eventData, dragStartEvent);
	}
}
