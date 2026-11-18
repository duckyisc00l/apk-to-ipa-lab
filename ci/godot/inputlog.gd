extends Node
# Lab-only autoload (route-godot input "inputlog"): prints every touch and action so a simulator run
# shows where the game sees each tap. Works in Godot 3 and 4.

func _ready():
	print("INPUTLOG viewport ", get_viewport().get_visible_rect().size)

func _input(e):
	if e is InputEventScreenTouch or e is InputEventAction or e is InputEventMouseButton:
		print("INPUTLOG ", e.as_text())
