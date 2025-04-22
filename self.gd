extends Node3D
var KUGEL

var pos
var posRange = 2

var rota
var rotaSpeed = 0.001
var rotaRange = 360

var forSca
var sca

var rad
var height

var r = 0.5
var g = 0.1
var b = 0.1
var emiR
var emiG
var emiB
var colRange = 0.2

var mat

const  kugel = preload("res://kugel.tscn")

@onready var self_mesh: Node3D = $"."
@onready var cam_rotate: Node3D = $"../camRotate"

func _process(delta: float) -> void:
	cam_rotate.rotation.y += rotaSpeed
	if Input.is_action_pressed("rotate_left"):
		cam_rotate.rotation.y -= rotaSpeed * 2
		
	if Input.is_action_pressed("fast"):
		KUGEL = kugel.instantiate()
		add_child(KUGEL)
		Counter.menge += 1
		Counter.mengeKugeln += 1
		_update()
		print(Counter.menge)

func _input(event):
	if event.is_action_pressed("add"):
		KUGEL = kugel.instantiate()
		add_child(KUGEL)
		Counter.menge += 1
		Counter.mengeKugeln += 1
		print(Counter.menge)
		
		for i in Counter.mengeKugeln:
			i = get_child(i)
			
			pos = Vector3(randf_range(-posRange, posRange), randf_range(-posRange, posRange), randf_range(-posRange, posRange))
			i.position = pos
			
			rota = Vector3(randf_range(-rotaRange, rotaRange), randf_range(-rotaRange, rotaRange), randf_range(-rotaRange, rotaRange))
			i.rotation = rota
			
			rad = randf_range(0.2, 4) * 0.25
			i.mesh.radius = rad
			
			height = randf_range(0.2, 4) * 1.0
			i.mesh.height = height
			
			forSca = randf_range(0.1, 0.4)
			sca = Vector3(forSca, forSca, forSca)
			i.scale = sca
			
			emiR = randf_range(0, colRange) + r
			emiG = randf_range(0, colRange) + g
			emiB = randf_range(0, colRange) + b
			i.material_override.emission = Color(emiR, emiG, emiB)
			
func _update():
	for i in Counter.mengeKugeln:
			i = get_child(i)
			
			pos = Vector3(randf_range(-posRange, posRange), randf_range(-posRange, posRange), randf_range(-posRange, posRange))
			i.position = pos
			
			rota = Vector3(randf_range(-rotaRange, rotaRange), randf_range(-rotaRange, rotaRange), randf_range(-rotaRange, rotaRange))
			i.rotation = rota
			
			rad = randf_range(0.2, 4) * 0.25
			i.mesh.radius = rad
			
			height = randf_range(0.2, 4) * 1.0
			i.mesh.height = height
			
			forSca = randf_range(0.1, 0.4)
			sca = Vector3(forSca, forSca, forSca)
			i.scale = sca
			
			emiR = randf_range(0, colRange) + r
			emiG = randf_range(0, colRange) + g
			emiB = randf_range(0, colRange) + b
			i.material_override.emission = Color(emiR, emiG, emiB)
