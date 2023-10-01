extends CharacterBody2D


const SPEED = 150.0

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
		


func _on_detection_area_body_exited(body):
	if body == target:
		chasing = false 
