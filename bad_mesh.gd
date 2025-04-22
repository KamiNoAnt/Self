extends Node3D

var BADMINTON
const badminton = preload("res://badminton.tscn")

var pos
var posRange = 2

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
var colRange = 0.2

var mat

func _input(event):
	if event.is_action_pressed("badm"):
		BADMINTON = badminton.instantiate()
		add_child(BADMINTON)
		Counter.menge += 1
		Counter.mengeBad += 1
		print(Counter.menge)
		
		for i in Counter.mengeBad:
			i = get_child(i)
			
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
