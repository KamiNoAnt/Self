extends Node3D

var USB
const usb = preload("res://usb.tscn")

var pos
var posRangeXZ = 4
var posRangeY = 6

var rota
var rotaSpeed = 0.001
var rotaRange = 360
var sca

var emiR
var emiG
var emiB

var mat

func _input(event):
	if event.is_action_pressed("us"):
		USB = usb.instantiate()
		add_child(USB)
		Counter.menge += 1
		Counter.mengeUsb += 1
		print(Counter.menge)
		
		for i in Counter.mengeUsb:
			i = get_child(i)
			
			pos = Vector3(randf_range(-posRangeXZ, posRangeXZ), randf_range(-posRangeY, posRangeY), randf_range(-posRangeXZ, posRangeXZ))
			i.position = pos
			
			rota = Vector3(randf_range(-rotaRange, rotaRange), randf_range(-rotaRange, rotaRange), randf_range(-rotaRange, rotaRange))
			i.rotation = rota
			
			sca = randf_range(0.2, 0.6)
			i.scale = Vector3(1, 1, 1) * sca
			
			emiR = randf_range(-Counter.colRange, Counter.colRange) + Counter.r
			emiG = randf_range(-Counter.colRange, Counter.colRange) + Counter.g
			emiB = randf_range(-Counter.colRange, Counter.colRange) + Counter.b
			i.material_override.emission = Color(emiR, emiG, emiB)
