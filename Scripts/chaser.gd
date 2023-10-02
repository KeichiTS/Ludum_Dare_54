extends CharacterBody2D


@export var speed := 30

var spwan_position : Vector2
var target = null

@onready var return_timer = $ReturnTimer as Timer
@onready var navi_agent = $NaviAgent as NavigationAgent2D



# Called when the node enters the scene tree for the first time.
func _ready():
	print(spwan_position)
	spwan_position = self.global_position
	print(spwan_position)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	
	
	if is_instance_valid(target):
		look_at(target.global_position)
		navi_agent.set_target_position(target.global_position)
		
	if navi_agent.is_navigation_finished():
		velocity = Vector2.ZERO
		return
		
	var next_position: Vector2 = navi_agent.get_next_path_position()
	var new_direction: Vector2 = global_position.direction_to(next_position)
	
	if is_instance_valid(target):
		var new_distance = global_position.distance_to(target.global_position)
		navi_agent.set_velocity(new_direction*speed)


func _on_navi_agent_velocity_computed(safe_velocity : Vector2):
	velocity = safe_velocity
	move_and_slide()


func _on_detection_body_entered(body):
	if body.is_in_group("player"):
		target = body
		
		if not return_timer.is_stopped():
			return_timer.stop()
	

func _on_detection_body_exited(body):
	if body.is_in_group("player"):
		target = body
		navi_agent.set_target_position(self.global_position)
		return_timer.start()
		target = null


func _on_return_timer_timeout():
	target = spwan_position
	navi_agent.set_target_position(target)
	print("pronto")

