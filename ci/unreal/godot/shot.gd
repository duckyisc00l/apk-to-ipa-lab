# Lab: wait for the level to draw, save a screenshot, quit. Godot autoload added only in the lab run.
extends Node
var frames := 0
func _process(_d):
	frames += 1
	if frames == 90:
		var p = OS.get_environment("SHOT"); if p == "": p = "user://shot.png"
		get_viewport().get_texture().get_image().save_png(p); print("SHOT SAVED ", p); get_tree().quit()
