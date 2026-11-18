extends Node
# Lab-only autoload (route-godot input "inputlog"): prints every touch and action so a simulator run
# shows where the game sees each tap. Works in Godot 3 and 4. push_error, because a Godot 3 release build
# on iOS drops print() (only errors reach the system log, sim-applog.log).

func _ready():
	push_error("INPUTLOG viewport " + str(get_viewport().get_visible_rect().size))

func _input(e):
	if e is InputEventScreenTouch or e is InputEventAction or e is InputEventMouseButton:
		push_error("INPUTLOG " + e.as_text())
