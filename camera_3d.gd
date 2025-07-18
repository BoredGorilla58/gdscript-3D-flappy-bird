extends Camera3D


var tilt : float = 0.0

func _process(delta: float) -> void:
	return
	tilt = 0
	if Input.is_action_pressed("action_left"):
		tilt = -5
	elif Input.is_action_pressed("action_right"):
		tilt = 5
	
	rotation_degrees.z = lerp(  rotation_degrees.z , tilt , delta)
