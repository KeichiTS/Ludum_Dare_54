extends Node2D


func _ready():
	modulate.r = 0
	modulate.g = 0
	modulate.b = 0
	$transition.play("event1")


func _on_button_pressed():
	$transition.play('event2')
	await $transition.animation_finished
	get_tree().change_scene_to_file("res://Scenes/map.tscn")
