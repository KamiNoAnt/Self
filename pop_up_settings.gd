extends Node2D
@onready var screenshot_button: Button = $Window/screenshot_button
@onready var reset_button: Button = $Window/reset_button
@onready var meshes: Node3D = $"../meshes"
@onready var option_button: OptionButton = $Window/OptionButton

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
	
