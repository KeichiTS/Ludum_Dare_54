extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	modulate.r = 0
	modulate.g = 0
	modulate.b = 0
	$transition.play("event1")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass



func _on_button_2_pressed():
	$transition.play("event2")
	await $transition.animation_finished
	get_tree().change_scene_to_file("res://Scenes/title_screen.tscn")
