extends StaticBody2D

var bullet = preload("res://Objects/bullet.tscn")



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_timer_timeout():
	var ammo = bullet.instantiate()
	ammo.global_position = $muzzle.global_position
	if rotation_degrees > 0:
		ammo.rotation_degrees = rotation_degrees
		ammo.velocity *= -1
	get_parent().add_child(ammo)
