extends CharacterBody2D


const SPEED = 100.0


var direction = 1 



func _physics_process(delta):

	velocity.x = direction * SPEED
	move_and_slide()


func _on_area_body_entered(body):
	if body.is_in_group('object'):
		rotation += PI
		direction *= -1


func _on_hitbox_body_entered(body):
	if body.is_in_group('player'):
		body.die()
