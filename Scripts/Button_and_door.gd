extends Node2D

@export var n_door = 0
@onready var audio_stream_player = $"../AudioStreamPlayer"

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	if GAME.door_oppened[n_door] == 1:
		activate_door()


func _on_button_body_entered(body):
	if body.is_in_group('player'):
		GAME.door_oppened[n_door] = 1
		audio_stream_player.pitch_scale = randf_range(0.85,1.15)
		audio_stream_player.play()
		activate_door()
		
func activate_door():
	if has_node("door"):
		$door.queue_free()
		$button.queue_free()
		$light_door_red.queue_free()
		$light_door_green.show()
