# Skill step X4: build res://level.tscn from an Unreal level exported by ue2godot.
# Run: godot --headless --path <project> --script res://build_level.gd -- <levels/Map.json>
extends SceneTree

func _init():
	var args = OS.get_cmdline_user_args()
	var data = JSON.parse_string(FileAccess.get_file_as_string(args[0]))
	var root = Node3D.new(); root.name = "Level"
	var placed = 0; var missing = {}; var centre = Vector3.ZERO
	for m in data["meshes"]:
		var path = "res://meshes/" + str(m["mesh"]).trim_prefix("/")
		if not ResourceLoader.exists(path):
			missing[path] = true; continue
		var inst = (load(path) as PackedScene).instantiate()
		var xf = m.get("xf", m)
		var p = xf["pos"]; var r = xf["rot"]; var s = xf["scale"]
		inst.transform = Transform3D(Basis(Quaternion(r[0], r[1], r[2], r[3]).normalized()).scaled(Vector3(s[0], s[1], s[2])), Vector3(p[0], p[1], p[2]))
		inst.name = str(m["name"]).validate_node_name()
		root.add_child(inst)
		for mi in inst.find_children("*", "MeshInstance3D", true, false):
			mi.create_trimesh_collision()   # so the player can stand on the level
		_own(inst, root); placed += 1; centre += inst.position
	# the Unreal level's own sun if it had one, else a default; plus sky, so it's never pitch black
	var sun = DirectionalLight3D.new(); sun.name = "Sun"; sun.shadow_enabled = true
	sun.rotation_degrees = Vector3(-50, -30, 0)
	for l in data["lights"]:
		if l["kind"] == "DirectionalLight":
			var q = l["xf"]["rot"]; sun.basis = Basis(Quaternion(q[0], q[1], q[2], q[3]).normalized())
	root.add_child(sun); sun.owner = root
	var env = WorldEnvironment.new(); env.name = "Env"; env.environment = Environment.new()
	env.environment.background_mode = Environment.BG_SKY; env.environment.sky = Sky.new(); env.environment.sky.sky_material = ProceduralSkyMaterial.new()
	env.environment.ambient_light_source = Environment.AMBIENT_SOURCE_SKY
	root.add_child(env); env.owner = root
	var player = load("res://player.tscn").instantiate(); player.name = "Player"
	player.position = (centre / max(placed, 1)) + Vector3(0, 3, 0)   # above the middle of the level
	root.add_child(player); player.owner = root
	var scene = PackedScene.new(); scene.pack(root)
	ResourceSaver.save(scene, "res://level.tscn")
	print("LEVEL BUILT: placed %d meshes, missing %d mesh files" % [placed, missing.size()])
	for k in missing.keys().slice(0, 10): print("  missing ", k)
	quit()

func _own(n, owner):
	for c in n.get_children():
		c.owner = owner; _own(c, owner)
