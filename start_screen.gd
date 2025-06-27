extends Control

@onready var start_button: Button = $PanelContainer/start_button
@onready var start_screen: Control = $"."
var START_NOISE = preload("res://start_noise.tres")
var speed = -50
var seed_timer = 0
var seed_goal = 60
var rot = 0
@onready var panel_container: PanelContainer = $PanelContainer
var anim_speed = 3

func _on_start_button_pressed() -> void:
	var cancel_event = InputEventAction.new()
	cancel_event.action = "accept"
	cancel_event.pressed = true
	Input.parse_input_event(cancel_event)
	#start_screen.visible = false
	Counter.start_anim = true

func _process(delta: float) -> void:
	START_NOISE.offset = START_NOISE.offset + Vector3(speed, speed/2.0, 0).rotated(Vector3(0,0,1), rot) * delta
	rot += 0.005
	
	if seed_timer == seed_goal:
		START_NOISE.seed += 1
		seed_timer = 0
	else:
		seed_timer += 1
		
	if Counter.start_anim == true and panel_container.scale > Vector2(0, 0):
		panel_container.scale = panel_container.scale + Vector2(-anim_speed, -anim_speed) * delta
		
	elif Counter.start_anim == false and panel_container.scale < Vector2(1, 1):
		panel_container.scale = panel_container.scale + Vector2(anim_speed, anim_speed) * delta
		
	if panel_container.scale < Vector2(0, 0):
		panel_container.scale = Vector2(0, 0)
		
	if panel_container.scale > Vector2(1, 1):
		panel_container.scale = Vector2(1, 1)
