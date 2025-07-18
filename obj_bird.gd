extends Area3D

var velocity = Vector3.ZERO
var is_fly = false
var fly_timer = 0
@export var force_gravity = 0.05
@export var force_fly = 0.07

var isDead = false


func _process(delta: float) -> void:
	if isDead:
		is_fly = false
		rotation_degrees.z = 180
		return

	if not is_fly:
		if Input.is_action_just_pressed("fly"):
			is_fly = true
			fly_timer = 0.1
	else:
		fly_timer -= delta
		if fly_timer <= 0:
			fly_timer = 0
			is_fly = false
	var tilt = 0
	if Input.is_action_pressed("action_left"):
		velocity.x = -0.2
		tilt = -10
	if Input.is_action_pressed("action_right"):
		velocity.x = 0.2
		tilt = 10
	
	rotation_degrees.z = tilt



func _physics_process(delta: float) -> void:
	if is_fly:
		velocity.y = force_fly
	else:
		velocity.y = -1 * force_gravity

	position += velocity
	velocity = Vector3.ZERO
