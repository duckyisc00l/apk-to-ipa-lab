# Lab: wait for the level to draw, then take two screenshots: the player's view, and a wide shot that
# frames every model (so an empty view can't hide a missing level). Autoload added only in the lab run.
extends Node
var frames := 0
func _process(_d):
	frames += 1
	if frames == 60:
		_save("")
		var box := AABB(); var n := 0
		for mi in get_tree().root.find_children("*", "MeshInstance3D", true, false):
			var b = mi.global_transform * mi.get_aabb()
			box = b if n == 0 else box.merge(b); n += 1
		print("LEVEL BOUNDS: %d meshes, centre %s, size %s" % [n, box.get_center(), box.size])
		var cam := Camera3D.new(); get_tree().root.add_child(cam)
		cam.far = max(box.size.length() * 4.0, 1000.0)
		cam.global_position = box.get_center() + Vector3(0.6, 0.5, 0.8).normalized() * box.size.length() * 0.9
		cam.look_at(box.get_center(), Vector3.UP); cam.make_current()
	if frames == 90:
		_save("-overview"); get_tree().quit()

func _save(suffix):
	var p = OS.get_environment("SHOT"); if p == "": p = "user://shot.png"
	p = p.replace(".png", suffix + ".png")
	get_viewport().get_texture().get_image().save_png(p); print("SHOT SAVED ", p)
