extends Area2D

var velocity = 120

func _process(delta):
	translate(Vector2(velocity*delta,0))
	
func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()


func _on_area_entered(area):
	if area.is_in_group('object'):
		queue_free()


func _on_body_entered(body):
	if body.is_in_group('object'):
		queue_free()
