extends Node2D
@onready var screenshot_button: Button = $Window/screenshot_button
@onready var reset_button: Button = $Window/reset_button
@onready var meshes: Node3D = $"../meshes"
@onready var option_button: OptionButton = $Window/OptionButton

@onready var tcg_overlay: Control = $"../CanvasLayer/tcg_overlay"
@onready var card_name: Label3D = $"../camRotate/camStuck2/card/card_name"

const BG_GRADIENT = preload("res://bg_gradient.tres")
var bg_color
var BUTTON_COLOR = preload("res://button_color.tres")
var NORMAL_BUTTON = preload("res://normal_button.tres")
var SCROLL_GRABBER = preload("res://scroll_grabber.tres")
var BOX_MATERIAL = preload("res://box_material.tres")
var LINE_MATERIAL = preload("res://line_material.tres")
var COMMIT_BUTTON = preload("res://commit_button.tres")
@onready var bg_menu_color: ColorRect = $Window/OptionButton/PanelContainer/ColorRect
@onready var commit_button: Button = $Window/commit_button
@onready var start_screen: Control = $Window/CanvasLayer/start_screen

func _ready() -> void:
	for i  in Counter.paletten.keys():
		option_button.add_item(i)
		var gradient = Gradient.new()
		gradient.remove_point(1)
		var texture: GradientTexture2D = GradientTexture2D.new()
		texture.width = 100
		texture.height = 16     
		gradient.interpolation_mode = Gradient.GRADIENT_INTERPOLATE_CONSTANT
		for x in Counter.paletten[i].size():
			gradient.add_point(1.0/Counter.paletten[i].size()*x, Counter.paletten[i][x])
		gradient.remove_point(0)
		texture.gradient =  gradient
		option_button.set_item_icon(option_button.item_count-1, texture)
		option_button.selected = 3
		
		LINE_MATERIAL.set_shader_parameter('chroma_color_1', Counter.paletten[Counter.palette][0])
		if Counter.palette == 'black' or Counter.palette == 'grey' or Counter.palette == 'pure_white':
			BOX_MATERIAL.set_shader_parameter('chroma_color_1', Counter.paletten[Counter.palette][0])
		else:
			BOX_MATERIAL.set_shader_parameter('chroma_color_1', Counter.paletten[Counter.palette][4])
		
		#BG_GRADIENT.set_color(0, Counter.paletten[Counter.palette][0])
		bg_color = Counter.paletten[Counter.palette][0] + Color(0.4, 0.4, 0.4, 1)
		#BG_GRADIENT.set_color(1, bg_color)
		
		NORMAL_BUTTON.border_color = bg_color
		BUTTON_COLOR.bg_color = Counter.paletten[Counter.palette][0]
		BUTTON_COLOR.border_color = 'white'
		SCROLL_GRABBER.bg_color = Counter.paletten[Counter.palette][0]
		bg_menu_color.color = Counter.paletten[Counter.palette][0] * Color(0.5, 0.5, 0.5, 1)
		COMMIT_BUTTON.bg_color = Counter.paletten[Counter.palette][0]
		
func _on_screenshot_button_button_up() -> void:
	take_screenshot()
	
func take_screenshot():
	var timestamp = Time.get_datetime_string_from_system(false, true).replace(":", "_")
	await RenderingServer.frame_post_draw
	var sshot = get_viewport().get_texture().get_image()
	#sshot.resize(3, 4, Image.INTERPOLATE_TRILINEAR)
	sshot.save_png("user://self_screenshots/screenshot " + timestamp + ".png")

func _on_reset_button_button_up() -> void:
	for i in meshes.get_child_count():
		var c = meshes.get_child(i)
		
		for j in c.get_child_count():
			var m = c.get_child(j)
			
			m.queue_free()
			Counter.menge = 0
			Counter.mengeBad = 0
			Counter.mengeKugeln = 0
			Counter.mengeBan = 0
			Counter.mengeUsb = 0
			
func _on_option_button_item_selected(index: int) -> void:
	Counter.palette = Counter.paletten.keys()[index]
	update_colors()
	get_window().grab_focus()
	
func update_colors():
	LINE_MATERIAL.set_shader_parameter('chroma_color_1', Counter.paletten[Counter.palette][0])
	if Counter.palette == 'black' or Counter.palette == 'grey' or Counter.palette == 'pure_white':
		BOX_MATERIAL.set_shader_parameter('chroma_color_1', Counter.paletten[Counter.palette][0])
	else:
		BOX_MATERIAL.set_shader_parameter('chroma_color_1', Counter.paletten[Counter.palette][4])
		
	#BG_GRADIENT.set_color(0, Counter.paletten[Counter.palette][0])
	bg_color = Counter.paletten[Counter.palette][0] + Color(0.4, 0.4, 0.4, 1)
	#BG_GRADIENT.set_color(1, bg_color)
	
	NORMAL_BUTTON.border_color = bg_color
	BUTTON_COLOR.bg_color = Counter.paletten[Counter.palette][0]
	BUTTON_COLOR.border_color = 'white'
	SCROLL_GRABBER.bg_color = Counter.paletten[Counter.palette][0]
	bg_menu_color.color = Counter.paletten[Counter.palette][0] * Color(0.5, 0.5, 0.5, 1)
	COMMIT_BUTTON.bg_color = Counter.paletten[Counter.palette][0]
	
	for i in meshes.get_child_count():
		var c = meshes.get_child(i)
		
		for j in c.get_child_count():
			var m = c.get_child(j)
			
			m.material_override.emission = Counter.paletten[Counter.palette].pick_random()
			
			
func _on_commit_button_pressed() -> void:
	var cancel_event = InputEventAction.new()
	cancel_event.action = "accept"
	cancel_event.pressed = true
	Input.parse_input_event(cancel_event)
	#start_screen.visible = true
	Counter.start_anim = false


func _on_badminton_button_pressed() -> void:
	var cancel_event = InputEventAction.new()
	cancel_event.action = "badm"
	cancel_event.pressed = true
	Input.parse_input_event(cancel_event)
	_simulate_update()


func _on_usb_button_pressed() -> void:
	var cancel_event = InputEventAction.new()
	cancel_event.action = "us"
	cancel_event.pressed = true
	Input.parse_input_event(cancel_event)
	_simulate_update()


func _on_banana_button_pressed() -> void:
	var cancel_event = InputEventAction.new()
	cancel_event.action = "banan"
	cancel_event.pressed = true
	Input.parse_input_event(cancel_event)
	_simulate_update()


func _on_capsule_button_pressed() -> void:
	var cancel_event = InputEventAction.new()
	cancel_event.action = "add"
	cancel_event.pressed = true
	Input.parse_input_event(cancel_event)
	_simulate_update()
	
func _simulate_update():
	var cancel_event = InputEventAction.new()
	cancel_event.action = "update"
	cancel_event.pressed = true
	Input.parse_input_event(cancel_event)
	
