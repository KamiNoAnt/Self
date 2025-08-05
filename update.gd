extends Node3D
@onready var meshes: Node3D = $meshes
@onready var self_mesh: Node3D = $meshes/selfMesh
@onready var bad_mesh: Node3D = $meshes/badMesh
@onready var ban_mesh: Node3D = $meshes/banMesh
@onready var usb_mesh: Node3D = $meshes/usbMesh
@onready var katana_mesh: Node3D = $meshes/katanaMesh
@onready var controller_mesh: Node3D = $meshes/controllerMesh
@onready var plane_mesh: Node3D = $meshes/planeMesh
@onready var cross_mesh: Node3D = $meshes/crossMesh
@onready var car_mesh: Node3D = $meshes/carMesh


var pos
var posRangeXZ = 4
var posRangeY = 7

var rota
var rotaSpeed = 0.001
var rotaRange = 360

var forSca
var sca

var rad
var height

@onready var post_fx: CanvasLayer = $PostFX

func _ready() -> void:
	pass

func _input(event):
	if event.is_action_pressed("update"):
		_update()
				
	if event.is_action_pressed("reset"):
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
		
func _update():
	for i in meshes.get_child_count():
		var c = meshes.get_child(i)
		
		for j in c.get_child_count():
			var m = c.get_child(j)
			
			pos = Vector3(randf_range(-posRangeXZ, posRangeXZ), randf_range(-posRangeY, posRangeY), randf_range(-posRangeXZ, posRangeXZ))
			m.position = pos
			
			rota = Vector3(randf_range(-rotaRange, rotaRange), randf_range(-rotaRange, rotaRange), randf_range(-rotaRange, rotaRange))
			m.rotation = rota
			
			if c == self_mesh:
				rad = randf_range(0.2, 4) * 0.25
				m.mesh.radius = rad
				
				height = randf_range(0.2, 4) * 1.0
				m.mesh.height = height
				
			sca = randf_range(0.2, 0.6)
				
			m.scale = Vector3(1, 1, 1) * sca
			
			if c == bad_mesh:
				sca = randf_range(0.2, 0.6)
				var bad_sca = sca / 2
				m.scale = Vector3(1, 1, 1) * bad_sca
			
			if c == katana_mesh:
				sca = randf_range(0.2, 0.6)
				var katana_sca = sca * 3
				m.scale = Vector3(1, 1, 1) * katana_sca
				
			if c == controller_mesh:
				sca = randf_range(0.2, 0.6)
				var controller_sca = sca * 3
				m.scale = Vector3(1, 1, 1) * controller_sca
				
			if c == plane_mesh:
				sca = randf_range(0.2, 0.6)
				var plane_sca = sca / 3
				m.scale = Vector3(1, 1, 1) * plane_sca
				
			if c == cross_mesh:
				sca = randf_range(0.2, 0.6)
				var cross_sca = sca * 3
				m.scale = Vector3(1, 1, 1) * cross_sca
				
			if c == car_mesh:
				sca = randf_range(0.2, 0.6)
				var car_sca = sca / 6
				m.scale = Vector3(1, 1, 1) * car_sca
			
			m.material_override.emission = Counter.paletten[Counter.palette].pick_random()
		
