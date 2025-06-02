extends Node3D
@onready var meshes: Node3D = $meshes
@onready var self_mesh: Node3D = $meshes/selfMesh

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

var emiR
var emiG
var emiB

func _ready() -> void:
	pass
	#points_dict.keys()

func _input(event):
	if event.is_action_pressed("update"):
		
		for i in meshes.get_child_count():
			var c = meshes.get_child(i)
			
			for j in c.get_child_count():
				var m = c.get_child(j)
				
				pos = Vector3(randf_range(-posRangeXZ, posRangeXZ), randf_range(-posRangeY, posRangeY), randf_range(-posRangeXZ, posRangeXZ))
				m.position = pos
				
				rota = Vector3(randf_range(-rotaRange, rotaRange), randf_range(-rotaRange, rotaRange), randf_range(-rotaRange, rotaRange))
				m.rotation = rota
				
				if c == self_mesh:
					rad = randf_range(0.2, 4) * 0.25
					m.mesh.radius = rad
					
					height = randf_range(0.2, 4) * 1.0
					m.mesh.height = height
				
				sca = randf_range(0.2, 0.6)
				m.scale = Vector3(1, 1, 1) * sca
				
				m.material_override.emission = Counter.paletten[Counter.palette].pick_random()
		
		
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
			
	if event.is_action_pressed("reset"):
		for i in meshes.get_child_count():
			var c = meshes.get_child(i)
		
			for j in c.get_child_count():
				var m = c.get_child(j)
				
				m.queue_free()
				Counter.menge = 0
				Counter.mengeBad = 0
				Counter.mengeKugeln = 0
				Counter.mengeBan = 0
				Counter.mengeUsb = 0
