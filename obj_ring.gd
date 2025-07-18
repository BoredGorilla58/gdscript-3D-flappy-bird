extends Area3D

var speed = 0.1
var index = 0
var pos_z = -30
var isHazard = false
var myMat : StandardMaterial3D
func _ready() -> void:
	myMat = $MeshInstance3D.get_surface_override_material(0).duplicate()
	$MeshInstance3D.set_surface_override_material(0 , myMat )

func reset_position():
	show()
	global_position.x = -3 + randf() * 6
	global_position.y = -1 + randf() * 2
	global_position.z = pos_z
	isHazard = randf() > 0.5
	if isHazard:
		$MeshInstance3D.get_surface_override_material(0).albedo_color = Color.RED
	else:
		$MeshInstance3D.get_surface_override_material(0).albedo_color = Color.GREEN

func change_speed(i :float):
	speed = i

func _physics_process(delta: float) -> void:
	global_position.z += speed
	
	if global_position.z > 5:
		reset_position()
	if global_position.z > 0:
		myMat.albedo_color.a = 0.1
