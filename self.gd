extends Node3D
var KUGEL

var pos
var posRangeXZ = 4
var posRangeY = 6

var rota
var rotaSpeed = 0.001
var rotaRange = 360

var sca

var rad
var height

var r = 0.5
var g = 0.1
var b = 0.1
var emiR
var emiG
var emiB
var colRange = 0.3

var mat

const  kugel = preload("res://kugel.tscn")

@onready var cam_stuck: Node3D = $"../../camRotate/camStuck"
@onready var cam_stuck_2: Node3D = $"../../camRotate/camStuck2"

@onready var self_mesh: Node3D = $"."

@onready var cam_rotate: Node3D = $"../../camRotate"
@onready var pc1: PhantomCamera3D = $"../../PhantomCamera3D"
@onready var pc2: PhantomCamera3D = $"../../PhantomCamera3D2"


func _process(delta: float) -> void:
	cam_rotate.rotation.y += rotaSpeed
	if Input.is_action_pressed("rotate_left"):
		cam_rotate.rotation.y -= rotaSpeed * 2
		
	if Input.is_action_pressed("fast"):
		KUGEL = kugel.instantiate()
		add_child(KUGEL)
		Counter.menge += 1
		Counter.mengeKugeln += 1
		Counter.iC = 1
		_update()
		print(Counter.menge)

func _input(event):
	if event.is_action_pressed("accept"):
		if pc1.priority == 1:
			pc1.priority = 0
			pc2.priority = 1
			rotaSpeed = 0.002
		elif pc2.priority == 1:
			pc2.priority = 0
			pc1.priority = 1
			rotaSpeed = 0.001
			
	if event.is_action_pressed("add"):
		KUGEL = kugel.instantiate()
		add_child(KUGEL)
		Counter.menge += 1
		Counter.mengeKugeln += 1
		Counter.iC = 1
		print(Counter.menge)
		
		for i in Counter.mengeKugeln:
			i = get_child(i)
			Counter.iC += 1
			
			pos = Vector3(randf_range(-posRangeXZ, posRangeXZ), randf_range(-posRangeY, posRangeY), randf_range(-posRangeXZ, posRangeXZ))
			i.position = pos
			
			rota = Vector3(randf_range(-rotaRange, rotaRange), randf_range(-rotaRange, rotaRange), randf_range(-rotaRange, rotaRange))
			i.rotation = rota
			
			rad = randf_range(0.2, 4) * 0.25
			i.mesh.radius = rad
			
			height = randf_range(0.2, 4) * 1.0
			i.mesh.height = height
			
			sca = randf_range(0.2, 0.6)
			i.scale = Vector3(1, 1, 1) * sca
			
			emiR = randf_range(-colRange, colRange) + r
			emiG = randf_range(-colRange, colRange) + g
			emiB = randf_range(-colRange, colRange) + b
			i.material_override.emission = Color(emiR, emiG, emiB)
			
func _update():
	for i in Counter.mengeKugeln:
			i = get_child(i)
			Counter.iC += 1
			
			pos = Vector3(randf_range(-posRangeXZ, posRangeXZ), randf_range(-posRangeY, posRangeY), randf_range(-posRangeXZ, posRangeXZ))
			i.position = pos
			
			rota = Vector3(randf_range(-rotaRange, rotaRange), randf_range(-rotaRange, rotaRange), randf_range(-rotaRange, rotaRange))
			i.rotation = rota
			
			rad = randf_range(0.2, 4) * 0.25
			i.mesh.radius = rad
			
			height = randf_range(0.2, 4) * 1.0
			i.mesh.height = height
			
			sca = randf_range(0.2, 0.6)
			i.scale = Vector3(1, 1, 1) * sca
			
			emiR = randf_range(-colRange, colRange) + r
			emiG = randf_range(-colRange, colRange) + g
			emiB = randf_range(-colRange, colRange) + b
			i.material_override.emission = Color(emiR, emiG, emiB)
