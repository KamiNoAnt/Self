extends Node3D

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

@onready var self_mesh: Node3D = $selfMesh
@onready var bad_mesh: Node3D = $badMesh
@onready var ban_mesh: Node3D = $banMesh
@onready var usb_mesh: Node3D = $usbMesh

func _input(event):
	if event.is_action_pressed("reload"):
		for i in Counter.mengeKugeln:
			i = self_mesh.get_child(i)
			
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
		
		for i in Counter.mengeBad:
			i = bad_mesh.get_child(i)
			pos = Vector3(randf_range(-posRange, posRange), randf_range(-posRange, posRange), randf_range(-posRange, posRange))
			i.position = pos
				
			rota = Vector3(randf_range(-rotaRange, rotaRange), randf_range(-rotaRange, rotaRange), randf_range(-rotaRange, rotaRange))
			i.rotation = rota
				
			forSca = randf_range(0.01, 0.2)
			sca = Vector3(forSca, forSca, forSca)
			i.scale = sca
				
			emiR = randf_range(0, colRange) + r
			emiG = randf_range(0, colRange) + g
			emiB = randf_range(0, colRange) + b
			i.material_override.emission = Color(emiR, emiG, emiB)
			
		for i in Counter.mengeBan:
			i = ban_mesh.get_child(i)
			pos = Vector3(randf_range(-posRange, posRange), randf_range(-posRange, posRange), randf_range(-posRange, posRange))
			i.position = pos
				
			rota = Vector3(randf_range(-rotaRange, rotaRange), randf_range(-rotaRange, rotaRange), randf_range(-rotaRange, rotaRange))
			i.rotation = rota
				
			forSca = randf_range(0.01, 0.2)
			sca = Vector3(forSca, forSca, forSca)
			i.scale = sca
				
			emiR = randf_range(0, colRange) + r
			emiG = randf_range(0, colRange) + g
			emiB = randf_range(0, colRange) + b
			i.material_override.emission = Color(emiR, emiG, emiB)
			
		for i in Counter.mengeUsb:
			i = usb_mesh.get_child(i)
			pos = Vector3(randf_range(-posRange, posRange), randf_range(-posRange, posRange), randf_range(-posRange, posRange))
			i.position = pos
				
			rota = Vector3(randf_range(-rotaRange, rotaRange), randf_range(-rotaRange, rotaRange), randf_range(-rotaRange, rotaRange))
			i.rotation = rota
				
			forSca = randf_range(0.05, 0.5)
			sca = Vector3(forSca, forSca, forSca)
			i.scale = sca
				
			emiR = randf_range(0, colRange) + r
			emiG = randf_range(0, colRange) + g
			emiB = randf_range(0, colRange) + b
			i.material_override.emission = Color(emiR, emiG, emiB)
			
