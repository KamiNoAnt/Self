extends Node3D

var CONTROLLER
const controller = preload("res://controller.tscn")

func _input(event):
	if event.is_action_pressed("controller"):
		CONTROLLER = controller.instantiate()
		add_child(CONTROLLER)
		Counter.menge += 1
		Counter.mengeUsb += 1
		print(Counter.menge)
