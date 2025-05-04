extends Node2D
@onready var screenshot_button: Button = $Window/screenshot_button
@onready var reset_button: Button = $Window/reset_button

@onready var r_slider: HSlider = $Window/r_slider
@onready var g_slider: HSlider = $Window/g_slider
@onready var b_slider: HSlider = $Window/b_slider
@onready var a_slider: HSlider = $Window/a_slider

@onready var meshes: Node3D = $"../meshes"

var emiR
var emiG
var emiB

func _on_screenshot_button_button_up() -> void:
	take_screenshot()
	
func take_screenshot():
	var timestamp = Time.get_datetime_string_from_system(false, true).replace(":", "_")
	await RenderingServer.frame_post_draw
	var sshot = get_viewport().get_texture().get_image()
	#sshot.resize(3, 4, Image.INTERPOLATE_TRILINEAR)
	sshot.save_png("user://self_screenshots/screenshot " + timestamp + ".png")

func _on_r_slider_value_changed(value: float) -> void:
	Counter.r = r_slider.value
	new_color()

func _on_g_slider_value_changed(value: float) -> void:
	Counter.g = g_slider.value
	new_color()

func _on_b_slider_value_changed(value: float) -> void:
	Counter.b = b_slider.value
	new_color()


func _on_a_slider_value_changed(value: float) -> void:
	Counter.colRange = a_slider.value
	new_color()

func new_color():
	for i in meshes.get_child_count():
		var c = meshes.get_child(i)
		
		for j in c.get_child_count():
			var m = c.get_child(j)
			
			emiR = randf_range(-Counter.colRange, Counter.colRange) + Counter.r
			emiG = randf_range(-Counter.colRange, Counter.colRange) + Counter.g
			emiB = randf_range(-Counter.colRange, Counter.colRange) + Counter.b
			
			m.material_override.emission = Color(emiR, emiG, emiB)


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
