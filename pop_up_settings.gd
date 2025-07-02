extends Node2D
@onready var screenshot_button: Button = $Window/screenshot_button
@onready var reset_button: Button = $Window/reset_button
@onready var meshes: Node3D = $"../meshes"

@onready var tcg_overlay: Control = $"../CanvasLayer/tcg_overlay"
@onready var card_name: Label3D = $"../camRotate/camStuck2/card/card_name"

@onready var screen_1: Control = $Window/screen1
@onready var screen_2: Control = $Window/screen2
@onready var screen_3: Control = $Window/screen3

const BG_GRADIENT = preload("res://bg_gradient.tres")
var bg_color
var BUTTON_COLOR = preload("res://button_color.tres")
var NORMAL_BUTTON = preload("res://normal_button.tres")
var SCROLL_GRABBER = preload("res://scroll_grabber.tres")
var BOX_MATERIAL = preload("res://box_material.tres")
var LINE_MATERIAL = preload("res://line_material.tres")
var COMMIT_BUTTON = preload("res://commit_button.tres")
@onready var scroll_container: ScrollContainer = $Window/screen2/ScrollContainer
@onready var commit_button: Button = $Window/screen3/commit_button
@onready var start_screen: Control = $Window/CanvasLayer/start_screen
@onready var color_button: Button = $Window/screen1/color_button

var COLOR_BUTTON_GRAD = preload("res://color_button_grad.tres")
var COLOR_BUTTON_TEX = preload("res://color_button_tex.tres")
var col_child = 0
@onready var color_background: PanelContainer = $Window/screen1/color_background
@onready var color_button_2: Button = $Window/screen1/color_button2

@onready var color: Button = $Window/switch_buttons/color
@onready var objects: Button = $Window/switch_buttons/objects
@onready var vfx: Button = $Window/switch_buttons/vfx

@onready var post_fx: CanvasLayer = $"../PostFX"
var VFX_BUTTON = preload("res://vfx_button.tres")

func _ready() -> void:
	post_fx.effects[0].enabled = false
	post_fx.effects[1].enabled = false
	post_fx.effects[2].enabled = false
	post_fx.effects[3].enabled = false
	post_fx.effects[4].enabled = false
	
	for i  in Counter.paletten.keys():
		var pos = 1
		var gradient = Gradient.new()
		gradient.remove_point(1)
		var texture: GradientTexture2D = GradientTexture2D.new()
		texture.width = 256
		texture.height = 32  
		gradient.interpolation_mode = Gradient.GRADIENT_INTERPOLATE_CONSTANT
		for x in Counter.paletten[i].size():
			gradient.add_point(1.0/Counter.paletten[i].size()*x, Counter.paletten[i][x])
		gradient.remove_point(0)
		texture.gradient = gradient
		for y in color_button.get_children():
			y.position.y = 60 + 45 * pos
			pos += 1
			
		color_button.get_child(col_child).icon = texture
		color_button.get_child(col_child).text = i
		col_child += 1
	
	var col_gradient = Gradient.new()
	col_gradient.remove_point(1)
	var col_texture : GradientTexture2D = GradientTexture2D.new()
	col_texture.width = 384
	col_texture.height = 64
	col_gradient.interpolation_mode = Gradient.GRADIENT_INTERPOLATE_CONSTANT
	for x in Counter.paletten[Counter.palette].size():
		col_gradient.add_point(1.0/Counter.paletten[Counter.palette].size()*x, Counter.paletten[Counter.palette][x])
	col_gradient.remove_point(0)
	col_texture.gradient = col_gradient
	color_button_2.icon = col_texture
	color_button_2.text = Counter.palette
	
	color.modulate = Counter.paletten[Counter.palette][0]
	
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
	COMMIT_BUTTON.bg_color = Counter.paletten[Counter.palette][0]
	
	VFX_BUTTON.bg_color = Counter.paletten[Counter.palette][0]
		
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
			
#func _on_option_button_item_selected(index: int) -> void:
	#Counter.palette = Counter.paletten.keys()[index]
	#update_colors()
	#get_window().grab_focus()
	
func update_colors():
	var col_gradient = Gradient.new()
	col_gradient.remove_point(1)
	var col_texture : GradientTexture2D = GradientTexture2D.new()
	col_texture.width = 384
	col_texture.height = 64
	col_gradient.interpolation_mode = Gradient.GRADIENT_INTERPOLATE_CONSTANT
	for x in Counter.paletten[Counter.palette].size():
		col_gradient.add_point(1.0/Counter.paletten[Counter.palette].size()*x, Counter.paletten[Counter.palette][x])
	col_gradient.remove_point(0)
	col_texture.gradient = col_gradient
	color_button_2.icon = col_texture
	color_button_2.text = Counter.palette
	
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
	COMMIT_BUTTON.bg_color = Counter.paletten[Counter.palette][0]
	
	for i in meshes.get_child_count():
		var c = meshes.get_child(i)
		
		for j in c.get_child_count():
			var m = c.get_child(j)
			
			m.material_override.emission = Counter.paletten[Counter.palette].pick_random()
			
	if screen_1.visible == true:
		color.modulate = Counter.paletten[Counter.palette][0]
	elif screen_2.visible == true:
		objects.modulate = Counter.paletten[Counter.palette][0]
	elif screen_3.visible == true:
		vfx.modulate = Counter.paletten[Counter.palette][0]
		
	VFX_BUTTON.bg_color = Counter.paletten[Counter.palette][0]
			
			
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
	


func _on_color_button_pressed() -> void:
	if color_button.get_child(0).visible == false:
		_hide_all()
	else:
		_show_all()

func _hide_all():
	color_background.size.y = 1080
	for x in color_button.get_child_count():
		color_button.get_child(x).visible = true
		
func _show_all():
	pass
	#color_background.size.y = 120
	#for x in color_button.get_child_count():
		#color_button.get_child(x).visible = false
	
func _on_c_1_pressed() -> void:
	Counter.palette = color_button.get_child(0).text
	update_colors()
	_show_all()
	get_window().grab_focus()


func _on_c_2_pressed() -> void:
	Counter.palette = color_button.get_child(1).text
	update_colors()
	_show_all()
	get_window().grab_focus()


func _on_c_3_pressed() -> void:
	Counter.palette = color_button.get_child(2).text
	update_colors()
	_show_all()
	get_window().grab_focus()


func _on_c_4_pressed() -> void:
	Counter.palette = color_button.get_child(3).text
	update_colors()
	_show_all()
	get_window().grab_focus()


func _on_c_5_pressed() -> void:
	Counter.palette = color_button.get_child(4).text
	update_colors()
	_show_all()
	get_window().grab_focus()


func _on_c_6_pressed() -> void:
	Counter.palette = color_button.get_child(5).text
	update_colors()
	_show_all()
	get_window().grab_focus()


func _on_c_7_pressed() -> void:
	Counter.palette = color_button.get_child(6).text
	update_colors()
	_show_all()
	get_window().grab_focus()


func _on_c_8_pressed() -> void:
	Counter.palette = color_button.get_child(7).text
	update_colors()
	_show_all()
	get_window().grab_focus()


func _on_c_9_pressed() -> void:
	Counter.palette = color_button.get_child(8).text
	update_colors()
	_show_all()
	get_window().grab_focus()


func _on_c_10_pressed() -> void:
	Counter.palette = color_button.get_child(9).text
	update_colors()
	_show_all()
	get_window().grab_focus()


func _on_c_11_pressed() -> void:
	Counter.palette = color_button.get_child(10).text
	update_colors()
	_show_all()
	get_window().grab_focus()


func _on_c_12_pressed() -> void:
	Counter.palette = color_button.get_child(11).text
	update_colors()
	_show_all()
	get_window().grab_focus()


func _on_c_13_pressed() -> void:
	Counter.palette = color_button.get_child(12).text
	update_colors()
	_show_all()
	get_window().grab_focus()


func _on_c_14_pressed() -> void:
	Counter.palette = color_button.get_child(13).text
	update_colors()
	_show_all()
	get_window().grab_focus()


func _on_c_15_pressed() -> void:
	Counter.palette = color_button.get_child(14).text
	update_colors()
	_show_all()
	get_window().grab_focus()


func _on_c_16_pressed() -> void:
	Counter.palette = color_button.get_child(15).text
	update_colors()
	_show_all()
	get_window().grab_focus()


func _on_color_pressed() -> void:
	screen_1.visible = true
	screen_2.visible = false
	screen_3.visible = false
	color.modulate = Counter.paletten[Counter.palette][0]
	objects.modulate = 'white'
	vfx.modulate = 'white'

func _on_objects_pressed() -> void:
	screen_1.visible = false
	screen_2.visible = true
	screen_3.visible = false
	color.modulate = 'white'
	objects.modulate = Counter.paletten[Counter.palette][0]
	vfx.modulate = 'white'

func _on_vfx_pressed() -> void:
	screen_1.visible = false
	screen_2.visible = false
	screen_3.visible = true
	color.modulate = 'white'
	objects.modulate = 'white'
	vfx.modulate = Counter.paletten[Counter.palette][0]


func _on_button_toggled(_toggled_on: bool) -> void:
	if post_fx.effects[0].enabled == false:
		post_fx.effects[0].enabled = true
	else:
		post_fx.effects[0].enabled = false


func _on_button_2_toggled(_toggled_on: bool) -> void:
	if post_fx.effects[1].enabled == false:
		post_fx.effects[1].enabled = true
	else:
		post_fx.effects[1].enabled = false


func _on_button_3_toggled(_toggled_on: bool) -> void:
	if post_fx.effects[2].enabled == false:
		post_fx.effects[2].enabled = true
	else:
		post_fx.effects[2].enabled = false


func _on_button_4_toggled(_toggled_on: bool) -> void:
	if post_fx.effects[3].enabled == false:
		post_fx.effects[3].enabled = true
	else:
		post_fx.effects[3].enabled = false


func _on_button_5_toggled(_toggled_on: bool) -> void:
	if post_fx.effects[4].enabled == false:
		post_fx.effects[4].enabled = true
	else:
		post_fx.effects[4].enabled = false
