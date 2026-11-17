# Skill step X4: build res://level.tscn from an Unreal level exported by ue2godot.
# Run: godot --headless --path <project> --script res://build_level.gd -- <levels/Map.json>
extends SceneTree
var textured := 0

func _init():
	var args = OS.get_cmdline_user_args()
	var data = JSON.parse_string(FileAccess.get_file_as_string(args[0]))
	var root = Node3D.new(); root.name = "Level"
	var placed = 0; var missing = {}; var centre = Vector3.ZERO
	# models CUE4Parse couldn't read were exported by UE Viewer instead (same axes and units)
	var um = {}
	if FileAccess.file_exists("res://umodel_map.json"):
		um = JSON.parse_string(FileAccess.get_file_as_string("res://umodel_map.json"))
	for m in data["meshes"]:
		var path = "res://meshes/" + str(m["mesh"]).trim_prefix("/")
		if not ResourceLoader.exists(path) and um.has(m["mesh"]):
			path = "res://" + str(um[m["mesh"]])
		if not ResourceLoader.exists(path):
			missing[path] = true; continue
		# Copy the model's meshes into the level as its own nodes: changes made to nodes inside an imported
		# glTF scene (materials, collision) are not saved with the level, so build our own MeshInstance3Ds.
		var src = (load(path) as PackedScene).instantiate()
		var inst = Node3D.new()
		var xf = m.get("xf", m)
		var p = xf["pos"]; var r = xf["rot"]; var s = xf["scale"]
		inst.transform = Transform3D(Basis(Quaternion(r[0], r[1], r[2], r[3]).normalized()).scaled(Vector3(s[0], s[1], s[2])), Vector3(p[0], p[1], p[2]))
		inst.name = str(m["name"]).validate_node_name()
		root.add_child(inst); inst.owner = root
		for mi in src.find_children("*", "MeshInstance3D", true, false):
			var copy = MeshInstance3D.new()
			copy.mesh = mi.mesh
			copy.transform = _relative(mi, src)
			inst.add_child(copy); copy.owner = root
			_texture_one(copy, path)
			var before = copy.get_child_count()
			copy.create_trimesh_collision()   # so the player can stand on the level
			for k in range(before, copy.get_child_count()):
				var body = copy.get_child(k); body.owner = root
				for c in body.get_children(): c.owner = root
		src.free()
		placed += 1; centre += inst.position
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
	print("LEVEL BUILT: placed %d meshes, missing %d mesh files, %d textured materials" % [placed, missing.size(), textured])
	for k in missing.keys().slice(0, 10): print("  missing ", k)
	quit()

# UE Viewer leaves each material as <name>.mat ("Diffuse=tex", "Normal=tex", "Other[0]=tex-nrm") and
# <name>.props.txt (full paths of the textures it uses), with the textures as .tga files. glTF itself carries
# no textures from it, so build a StandardMaterial3D per material from those files.
var _mat_cache = {}
func _texture_one(mi, gltf_path):
	if not gltf_path.begins_with("res://um/"): return
	for i in mi.mesh.get_surface_count():
		var m = mi.mesh.surface_get_material(i)
		if m == null or m.resource_name == "": continue
		var mat = _material_for(m.resource_name, gltf_path.get_base_dir())
		if mat: mi.set_surface_override_material(i, mat)

func _relative(node, top):   # node's transform relative to the glTF scene's root
	var t = Transform3D.IDENTITY; var n = node
	while n != null and n != top:
		t = n.transform * t; n = n.get_parent()
	return t

func _material_for(name, folder):
	if _mat_cache.has(name): return _mat_cache[name]
	var found = _find_file(folder, name + ".mat")
	if found == "": _mat_cache[name] = null; print("  MAT %s: no .mat file" % name); return null
	var tex_paths = {}   # texture name -> res:// path, from the props file's full references
	var props = found.get_basename() + ".props.txt"
	if FileAccess.file_exists(props):
		for line in FileAccess.get_file_as_string(props).split("\n"):
			var r = RegEx.create_from_string("Texture2D'/(Game|Engine)/([^.']+)\\.")
			var hit = r.search(line)
			if hit:
				var rel = hit.get_string(1) + "/" + hit.get_string(2)
				if hit.get_string(1) == "Engine": rel = "Engine/" + hit.get_string(2)
				tex_paths[rel.get_file()] = "res://um/" + rel + ".tga"
	var diffuse = ""; var normal = ""
	for line in FileAccess.get_file_as_string(found).split("\n"):
		var kv = line.strip_edges().split("=", true, 1)
		if kv.size() < 2: continue
		var key = kv[0]; var tex = kv[1]
		if key == "Diffuse" and diffuse == "": diffuse = tex
		elif key == "Normal" or ((tex.ends_with("-nrm") or tex.ends_with("_N") or tex.ends_with("_nrm")) and normal == ""): normal = tex
	if _is_normal(diffuse):
		if normal == "": normal = diffuse
		diffuse = ""
		for t in tex_paths.keys():
			if not _is_normal(t): diffuse = t; break
	var mat = StandardMaterial3D.new(); mat.resource_name = name
	var d = _tex(diffuse, tex_paths, folder)
	if d: mat.albedo_texture = d
	var n = _tex(normal, tex_paths, folder)
	if n: mat.normal_enabled = true; mat.normal_texture = n
	mat.roughness = 0.9
	_mat_cache[name] = mat if d else null
	print("  MAT %s: diffuse '%s' -> %s, normal '%s' -> %s" % [name, diffuse, "ok" if d else "NOT LOADED (" + str(tex_paths.get(diffuse, "?")) + ")", normal, "ok" if n else "-"])
	if d: textured += 1
	return _mat_cache[name]

func _tex(tname, tex_paths, folder):
	if tname == "": return null
	# CUE4Parse's PNGs first (they decode Android's ETC1 textures), then UE Viewer's .tga
	var p = _find_file("res://tex", tname + ".png", "res://tex")
	if p == "" or not ResourceLoader.exists(p): p = tex_paths.get(tname, "")
	if p == "" or not ResourceLoader.exists(p): p = _find_file(folder, tname + ".tga")
	return load(p) if p != "" and ResourceLoader.exists(p) else null

static func _is_normal(t): return t.ends_with("-nrm") or t.ends_with("_N") or t.ends_with("_nrm") or t.to_lower().ends_with("normal")

func _find_file(folder, file, root = "res://um"):
	if FileAccess.file_exists(folder + "/" + file): return folder + "/" + file
	if not DirAccess.dir_exists_absolute(root): return ""
	var stack = [root]
	while stack.size() > 0:
		var dir = stack.pop_back()
		for f in DirAccess.get_files_at(dir):
			if f == file: return dir + "/" + f
		for sub in DirAccess.get_directories_at(dir): stack.append(dir + "/" + sub)
	return ""

func _own(n, owner):
	for c in n.get_children():
		c.owner = owner; _own(c, owner)
