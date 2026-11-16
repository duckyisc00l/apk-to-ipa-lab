# Touch controls: left half of the screen moves (drag like a stick), right half looks around.
# Keyboard/mouse also work for testing. Kept clear of the notch: nothing is drawn near the edges.
extends CharacterBody3D
@export var speed := 4.0
var move_finger := -1; var move_start := Vector2.ZERO; var move_vec := Vector2.ZERO
var look_finger := -1
@onready var cam: Camera3D = $Camera3D

func _input(e):
	var half = get_viewport().get_visible_rect().size.x / 2
	if e is InputEventScreenTouch:
		if e.pressed:
			if e.position.x < half and move_finger == -1: move_finger = e.index; move_start = e.position
			elif e.position.x >= half and look_finger == -1: look_finger = e.index
		else:
			if e.index == move_finger: move_finger = -1; move_vec = Vector2.ZERO
			if e.index == look_finger: look_finger = -1
	elif e is InputEventScreenDrag:
		if e.index == move_finger: move_vec = ((e.position - move_start) / 80.0).limit_length(1.0)
		elif e.index == look_finger:
			rotate_y(-e.relative.x * 0.005)
			cam.rotation.x = clamp(cam.rotation.x - e.relative.y * 0.005, -1.4, 1.4)

func _physics_process(dt):
	var v = move_vec + Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	var dir = (transform.basis * Vector3(v.x, 0, v.y)).normalized() * min(v.length(), 1.0)
	velocity.x = dir.x * speed; velocity.z = dir.z * speed
	velocity.y = 0.0 if is_on_floor() else velocity.y - 9.8 * dt
	move_and_slide()
