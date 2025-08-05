extends Node3D

var CROSS
const cross = preload("res://cross.tscn")

func _input(event):
	if event.is_action_pressed("cross"):
		CROSS = cross.instantiate()
		add_child(CROSS)
		Counter.menge += 1
		Counter.mengeUsb += 1
		print(Counter.menge)
