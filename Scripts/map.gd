extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	modulate.r = 0
	modulate.g = 0
	modulate.b = 0
	$modulate.play("event2")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func restart_level() -> void:
	$modulate.play("event1")
	await $modulate.animation_finished
	get_tree().reload_current_scene()
