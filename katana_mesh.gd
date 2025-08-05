extends Node3D

var KATANA
const katana = preload("res://katana.tscn")

func _input(event):
	if event.is_action_pressed("katana"):
		KATANA = katana.instantiate()
		add_child(KATANA)
		Counter.menge += 1
		Counter.mengeUsb += 1
		print(Counter.menge)
