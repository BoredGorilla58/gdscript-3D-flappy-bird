extends Node3D

var score = 0
var ring_speed = 0.1

func change_speed():
	ring_speed += 0.02
	ring_speed = min( ring_speed , 0.5 )
	for ring in $rings.get_children():
		ring.change_speed(ring_speed)
	print("ring_speed :",ring_speed)

func changeScore():
	score += 1
	$CanvasLayer/scr_game/label_score.text = str(score)

func start_game():
	pass

func end_game():
	$rings.process_mode = Node.PROCESS_MODE_DISABLED
	$obj_bird.isDead = true
	

func _on_obj_bird_area_entered(area: Area3D) -> void:
	if area.isHazard:
		end_game()
	else:
		changeScore()
		area.hide()
		if score % 4 == 0:
			change_speed()
	
