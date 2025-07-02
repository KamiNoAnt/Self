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

@onready var screen_1: Control = $"../../screen1"
@onready var screen_2: Control = $"../../screen2"
@onready var screen_3: Control = $"../../screen3"

@onready var button: Button = $"../../screen3/Button"
@onready var button_2: Button = $"../../screen3/Button2"
@onready var button_3: Button = $"../../screen3/Button3"
@onready var button_4: Button = $"../../screen3/Button4"
@onready var button_5: Button = $"../../screen3/Button5"

@onready var color: Button = $"../../switch_buttons/color"
@onready var objects: Button = $"../../switch_buttons/objects"
@onready var vfx: Button = $"../../switch_buttons/vfx"

func _on_start_button_pressed() -> void:
	var cancel_event = InputEventAction.new()
	cancel_event.action = "accept"
	cancel_event.pressed = true
	Input.parse_input_event(cancel_event)
	#start_screen.visible = false
	Counter.start_anim = true
	
	screen_1.visible = true
	screen_2.visible = false
	screen_3.visible = false
	
	color.modulate = Counter.paletten[Counter.palette][0]
	objects.modulate = 'white'
	vfx.modulate = 'white'
	
	var reset_event = InputEventAction.new()
	reset_event.action = "reset"
	reset_event.pressed = true
	Input.parse_input_event(reset_event)
	
	button.button_pressed = false
	button_2.button_pressed = false
	button_3.button_pressed = false
	button_4.button_pressed = false
	button_5.button_pressed = false

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
