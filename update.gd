extends Node3D
@onready var meshes: Node3D = $meshes

var pos
var posRangeXZ = 4
var posRangeY = 6

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
var colRange = 0.3

#@onready var self_mesh: Node3D = $meshes/selfMesh
#@onready var bad_mesh: Node3D = $meshes/badMesh
#@onready var ban_mesh: Node3D = $meshes/banMesh
#@onready var usb_mesh: Node3D = $meshes/usbMesh

func _input(event):
	if event.is_action_pressed("update"):
		
		for i in meshes.get_child_count():
			var c = meshes.get_child(i)
			Counter.iC = 1
			
			for j in c.get_child_count():
				var m = c.get_child(j)
				Counter.iC += 1
				
				pos = Vector3(randf_range(-posRangeXZ, posRangeXZ), randf_range(-posRangeY, posRangeY), randf_range(-posRangeXZ, posRangeXZ))
				m.position = pos
				
				rota = Vector3(randf_range(-rotaRange, rotaRange), randf_range(-rotaRange, rotaRange), randf_range(-rotaRange, rotaRange))
				m.rotation = rota
				
				#rad = randf_range(0.2, 4) * 0.25
				#m.mesh.radius = rad
				#
				#height = randf_range(0.2, 4) * 1.0
				#m.mesh.height = height
				
				sca = randf_range(0.2, 0.6)
				m.scale = Vector3(1, 1, 1) * sca
				
				emiR = randf_range(-colRange, colRange) + r
				emiG = randf_range(-colRange, colRange) + g
				emiB = randf_range(-colRange, colRange) + b
				m.material_override.emission = Color(emiR, emiG, emiB)
		
		
		#for i in Counter.mengeKugeln:
			#i = self_mesh.get_child(i)
			#
			#pos = Vector3(randf_range(-posRange, posRange), randf_range(-posRange, posRange), randf_range(-posRange, posRange))
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
			#forSca = randf_range(0.1, 0.4)
			#sca = Vector3(forSca, forSca, forSca)
			#i.scale = sca
			#
			#emiR = randf_range(0, colRange) + r
			#emiG = randf_range(0, colRange) + g
			#emiB = randf_range(0, colRange) + b
			#i.material_override.emission = Color(emiR, emiG, emiB)
		#
		#for i in Counter.mengeBad:
			#i = bad_mesh.get_child(i)
			#pos = Vector3(randf_range(-posRange, posRange), randf_range(-posRange, posRange), randf_range(-posRange, posRange))
			#i.position = pos
				#
			#rota = Vector3(randf_range(-rotaRange, rotaRange), randf_range(-rotaRange, rotaRange), randf_range(-rotaRange, rotaRange))
			#i.rotation = rota
				#
			#forSca = randf_range(0.01, 0.2)
			#sca = Vector3(forSca, forSca, forSca)
			#i.scale = sca
				#
			#emiR = randf_range(0, colRange) + r
			#emiG = randf_range(0, colRange) + g
			#emiB = randf_range(0, colRange) + b
			#i.material_override.emission = Color(emiR, emiG, emiB)
			#
		#for i in Counter.mengeBan:
			#i = ban_mesh.get_child(i)
			#pos = Vector3(randf_range(-posRange, posRange), randf_range(-posRange, posRange), randf_range(-posRange, posRange))
			#i.position = pos
				#
			#rota = Vector3(randf_range(-rotaRange, rotaRange), randf_range(-rotaRange, rotaRange), randf_range(-rotaRange, rotaRange))
			#i.rotation = rota
				#
			#forSca = randf_range(0.01, 0.2)
			#sca = Vector3(forSca, forSca, forSca)
			#i.scale = sca
				#
			#emiR = randf_range(0, colRange) + r
			#emiG = randf_range(0, colRange) + g
			#emiB = randf_range(0, colRange) + b
			#i.material_override.emission = Color(emiR, emiG, emiB)
			#
		#for i in Counter.mengeUsb:
			#i = usb_mesh.get_child(i)
			#pos = Vector3(randf_range(-posRange, posRange), randf_range(-posRange, posRange), randf_range(-posRange, posRange))
			#i.position = pos
				#
			#rota = Vector3(randf_range(-rotaRange, rotaRange), randf_range(-rotaRange, rotaRange), randf_range(-rotaRange, rotaRange))
			#i.rotation = rota
				#
			#forSca = randf_range(0.05, 0.5)
			#sca = Vector3(forSca, forSca, forSca)
			#i.scale = sca
				#
			#emiR = randf_range(0, colRange) + r
			#emiG = randf_range(0, colRange) + g
			#emiB = randf_range(0, colRange) + b
			#i.material_override.emission = Color(emiR, emiG, emiB)
			
