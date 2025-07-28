extends Control

@onready var start_button: Button = $PanelContainer/start_button
@onready var start_screen: Control = $"."
@onready var panel_container: PanelContainer = $PanelContainer
var anim_speed = 3
@onready var palette_2: Sprite2D = $"../../switch_buttons/color/Palette2"
@onready var objects_2: Sprite2D = $"../../switch_buttons/objects/Objects2"
@onready var vfx_2: Sprite2D = $"../../switch_buttons/vfx/Vfx2"

@onready var screen_1: Control = $"../../screen1"
@onready var screen_2: Control = $"../../screen2"
@onready var screen_3: Control = $"../../screen3"
@onready var switch_buttons: Control = $"../../switch_buttons"
@onready var name_screen: Control = $"../../name_screen"

@onready var button: Button = $"../../screen3/Button"
@onready var button_2: Button = $"../../screen3/Button2"
@onready var button_3: Button = $"../../screen3/Button3"
@onready var button_4: Button = $"../../screen3/Button4"
@onready var button_5: Button = $"../../screen3/Button5"

@onready var color: Button = $"../../switch_buttons/color"
@onready var objects: Button = $"../../switch_buttons/objects"
@onready var vfx: Button = $"../../switch_buttons/vfx"

@onready var start_video: VideoStreamPlayer = $PanelContainer/VideoStreamPlayer
@onready var name_change: LineEdit = $"../../name_screen/LineEdit"

func _on_start_button_pressed() -> void:
	var cancel_event = InputEventAction.new()
	cancel_event.action = "accept"
	cancel_event.pressed = true
	Input.parse_input_event(cancel_event)
	#Counter.start_anim = true
	start_screen.visible = false
	
	screen_1.visible = true
	screen_2.visible = false
	screen_3.visible = false
	name_screen.visible = false
	switch_buttons.visible = true
	
	palette_2.modulate = Counter.paletten[Counter.palette][0]
	objects_2.modulate = 'white'
	vfx_2.modulate = 'white'
	
	var reset_event = InputEventAction.new()
	reset_event.action = "reset"
	reset_event.pressed = true
	Input.parse_input_event(reset_event)
	
	button.button_pressed = false
	button_2.button_pressed = false
	button_3.button_pressed = false
	button_4.button_pressed = false
	button_5.button_pressed = false
	
	start_video.paused = true
	name_change.text = ''

#func _process(delta: float) -> void:
		
	#if Counter.start_anim == true and panel_container.scale > Vector2(0, 0):
		#panel_container.scale = panel_container.scale + Vector2(-anim_speed, -anim_speed) * delta
		#
	#elif Counter.start_anim == false and panel_container.scale < Vector2(1, 1):
		#panel_container.scale = panel_container.scale + Vector2(anim_speed, anim_speed) * delta
		#
	#if panel_container.scale < Vector2(0, 0):
		#panel_container.scale = Vector2(0, 0)
		#
	#if panel_container.scale > Vector2(1, 1):
		#panel_container.scale = Vector2(1, 1)
