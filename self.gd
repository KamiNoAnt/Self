extends Node3D
var KUGEL
@onready var meshes: Node3D = $".."

var rotaSpeed = 0.5
var scale_speed = 1.5
var move_speed = 600

const  kugel = preload("res://kugel.tscn")

@onready var cam_stuck: Node3D = $"../../camRotate/camStuck"
@onready var cam_stuck_2: Node3D = $"../../camRotate/camStuck2"

@onready var self_mesh: Node3D = $"."

@onready var cam_rotate: Node3D = $"../../camRotate"
@onready var pc1: PhantomCamera3D = $"../../PhantomCamera3D"
@onready var pc2: PhantomCamera3D = $"../../PhantomCamera3D2"

@onready var tcg_overlay: Control = $"../../CanvasLayer/tcg_overlay"
var name_box

@onready var pop_up_settings: Node2D = $"../../pop_up_settings"

func _ready() -> void:
	name_box = tcg_overlay.get_child(2)

func _process(delta: float) -> void:
	cam_rotate.rotation.y += rotaSpeed * delta
	if Input.is_action_pressed("rotate_left"):
		cam_rotate.rotation.y -= rotaSpeed * 2 * delta
		
	if Input.is_action_pressed("fast"):
		KUGEL = kugel.instantiate()
		add_child(KUGEL)
		Counter.menge += 1
		Counter.mengeKugeln += 1
		#_update()
		print(Counter.menge)
		
	if pc2.priority == 1 and tcg_overlay.scale > Vector2(1, 1):
		tcg_overlay.scale = tcg_overlay.scale - Vector2(scale_speed, scale_speed) * delta
		
	elif pc1.priority == 1 and tcg_overlay.scale < Vector2(2.5, 2.5):
		tcg_overlay.scale = tcg_overlay.scale + Vector2(scale_speed, scale_speed) * 2 * delta
		
	if tcg_overlay.scale <= Vector2(1, 1) and name_box.position.y <= 30:
		name_box.position += Vector2(0, move_speed) * delta
	
	elif tcg_overlay.scale >= Vector2(1, 1) and name_box.position.y >= -300:
		name_box.position -= Vector2(0, move_speed) * delta

func _input(event):
	if event.is_action_pressed("accept"):
		if pc1.priority == 1:
			pc1.priority = 0
			pc2.priority = 1
			tcg_overlay.get_child(0).play()
			tcg_overlay.get_child(1).play()
			rotaSpeed = rotaSpeed * 2
			
		elif pc2.priority == 1:
			pc2.priority = 0
			pc1.priority = 1
			await get_tree().create_timer(1.5).timeout
			tcg_overlay.get_child(0).stop()
			tcg_overlay.get_child(1).stop()
			rotaSpeed = rotaSpeed / 2
			
	if event.is_action_pressed("screenshot"):
		take_screenshot()
			
	if event.is_action_pressed("add"):
		KUGEL = kugel.instantiate()
		add_child(KUGEL)
		Counter.menge += 1
		Counter.mengeKugeln += 1
		print(Counter.menge)
		
		#for i in Counter.mengeKugeln:
			#i = get_child(i)
			#
			#pos = Vector3(randf_range(-posRangeXZ, posRangeXZ), randf_range(-posRangeY, posRangeY), randf_range(-posRangeXZ, posRangeXZ))
			#i.position = pos
			#
			#rota = Vector3(randf_range(-rotaRange, rotaRange), randf_range(-rotaRange, rotaRange), randf_range(-rotaRange, rotaRange))
			#i.rotation = rota
			#
			#rad = randf_range(0.2, 4) * 0.25
			#i.mesh.radius = rad
			#
			#height = randf_range(0.2, 4) * 1.0
			#i.mesh.height = height
			#
			#sca = randf_range(0.2, 0.6)
			#i.scale = Vector3(1, 1, 1) * sca
			#
			##emiR = randf_range(-Counter.colRange, Counter.colRange) + Counter.r
			##emiG = randf_range(-Counter.colRange, Counter.colRange) + Counter.g
			##emiB = randf_range(-Counter.colRange, Counter.colRange) + Counter.b
			#i.material_override.emission = Counter.vioPal.pick_random()
			
			
#func _update():
	#for i in Counter.mengeKugeln:
			#i = get_child(i)
			#
			#pos = Vector3(randf_range(-posRangeXZ, posRangeXZ), randf_range(-posRangeY, posRangeY), randf_range(-posRangeXZ, posRangeXZ))
			#i.position = pos
			#
			#rota = Vector3(randf_range(-rotaRange, rotaRange), randf_range(-rotaRange, rotaRange), randf_range(-rotaRange, rotaRange))
			#i.rotation = rota
			#
			#rad = randf_range(0.2, 4) * 0.25
			#i.mesh.radius = rad
			#
			#height = randf_range(0.2, 4) * 1.0
			#i.mesh.height = height
			#
			#sca = randf_range(0.2, 0.6)
			#i.scale = Vector3(1, 1, 1) * sca
			#
			##emiR = randf_range(-Counter.colRange, Counter.colRange) + Counter.r
			##emiG = randf_range(-Counter.colRange, Counter.colRange) + Counter.g
			##emiB = randf_range(-Counter.colRange, Counter.colRange) + Counter.b
			#i.material_override.emission = Counter.vioPal.pick_random()
			
func take_screenshot():
	var timestamp = Time.get_datetime_string_from_system(false, true).replace(":", "_")
	await RenderingServer.frame_post_draw
	var sshot = get_viewport().get_texture().get_image()
	#sshot.resize(3, 4, Image.INTERPOLATE_TRILINEAR)
	sshot.save_png("user://self_screenshots/screenshot " + timestamp + ".png")
