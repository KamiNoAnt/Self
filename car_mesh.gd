extends Node3D

var CAR
const car = preload("res://car.tscn")

func _input(event):
	if event.is_action_pressed("car"):
		CAR = car.instantiate()
		add_child(CAR)
		Counter.menge += 1
		Counter.mengeUsb += 1
		print(Counter.menge)
