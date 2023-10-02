extends CharacterBody2D


const SPEED = 50.0

@export var target : Node

var chasing = false

func _physics_process(delta: float) -> void:
	move_and_look()

func move_and_look():
	if chasing == true:
		velocity = position.direction_to(target.position) * SPEED
		move_and_slide()
	look_at(target.position)


func _on_detection_area_body_entered(body):
	if body == target:
		chasing = true
		$anim.play('chasing')
		


func _on_stop_chasing_area_body_exited(body):
	if body == target:
		chasing = false 
		$anim.pause()


func _on_hit_box_body_entered(body):
	if body.is_in_group('player'):
		body.die()
