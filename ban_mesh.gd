extends Node3D

var BANANA
const banana = preload("res://banana.tscn")

var pos
var posRangeXZ = 4
var posRangeY = 6

var rota
var rotaSpeed = 0.001
var rotaRange = 360

var forSca
var sca

var r = 0.5
var g = 0.1
var b = 0.1
var emiR
var emiG
var emiB
var colRange = 0.3

var mat

func _input(event):
	if event.is_action_pressed("banan"):
		BANANA = banana.instantiate()
		add_child(BANANA)
		Counter.menge += 1
		Counter.mengeBan += 1
		Counter.iC = 1
		print(Counter.menge)
		
		for i in Counter.mengeBan:
			i = get_child(i)
			Counter.iC += 1
			
			pos = Vector3(randf_range(-posRangeXZ, posRangeXZ), randf_range(-posRangeY, posRangeY), randf_range(-posRangeXZ, posRangeXZ))
			i.position = pos
			
			rota = Vector3(randf_range(-rotaRange, rotaRange), randf_range(-rotaRange, rotaRange), randf_range(-rotaRange, rotaRange))
			i.rotation = rota
			
			sca = randf_range(0.2, 0.6)
			i.scale = Vector3(1, 1, 1) * sca
			
			emiR = randf_range(-colRange, colRange) + r
			emiG = randf_range(-colRange, colRange) + g
			emiB = randf_range(-colRange, colRange) + b
			i.material_override.emission = Color(emiR, emiG, emiB)
