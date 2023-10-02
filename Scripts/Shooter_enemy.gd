extends StaticBody2D

var bullet = preload("res://Objects/bullet.tscn")



func _ready() -> void:
	$anim.play("shooting")

#func _on_timer_timeout():
#	shoot()

func shoot() -> void:
	var ammo = bullet.instantiate()
	ammo.global_position = $muzzle.global_position
	if rotation_degrees > 0:
		ammo.rotation_degrees = rotation_degrees
		ammo.velocity *= -1
	get_parent().add_child(ammo)
