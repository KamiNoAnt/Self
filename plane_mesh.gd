extends Node3D

var PLANE
const plane = preload("res://plane.tscn")

func _input(event):
	if event.is_action_pressed("plane"):
		PLANE = plane.instantiate()
		add_child(PLANE)
		Counter.menge += 1
		Counter.mengeUsb += 1
		print(Counter.menge)
