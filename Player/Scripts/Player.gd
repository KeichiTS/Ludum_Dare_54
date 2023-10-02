#A Code by: KeichiTS - 09.2023

extends CharacterBody2D

var vel = Vector2.ZERO
var rotatio_speed := 8.0

@export var speed : int = 300  # move speed in pixels/sec
@export var acelleration := 10

var stop = true 

func _physics_process(delta: float) -> void:
	print(get_parent().name)
	move(delta)
	
#Moving the player
func move(delta) -> void:
	####moving player
	var direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	#velocity = direction * speed
	velocity.x = move_toward(velocity.x, speed*direction.x, acelleration)
	velocity.y = move_toward(velocity.y, speed*direction.y, acelleration)
	velocity.normalized()
	
	move_and_slide()

	####changing face

	#look_at(get_global_mouse_position())
	var direction_to_look = (get_global_mouse_position() - global_position)
	var angle_to = transform.x.angle_to(direction_to_look)
	rotate(sign(angle_to)*min(delta*rotatio_speed,abs(angle_to)))
	
	if velocity.x == 0 and velocity.y == 0 and stop == false:
		stop = true
		$anim.pause()
	
	if velocity.x != 0 or velocity.y != 0 and stop == true:
		stop = false
		$anim.play("moving")
		

func die():
	#get_tree().reload_current_scene()
	if get_parent().name == 'Map':
		get_parent().restart_level()

###################################################
#     ~ It ain't much, but it's honest work ~     #
###################################################
##        #####################################   #
##          #############################         #
####            ######################            #
#####            #####           #                #
#######                                         ###
#########  #                                   ####
###########                              ## #######
#########      ###               ###       ########
#########     # ###             #####       #######
########      #####             ####         ######
########       ##                ##          ######
#######               ##                    #######
#######  ##           ####            ##      #####
####### #####        ########       #######    ####
########               #####                    ###
#########                                       ###
##########                                       ##
#########                                         #
###################################################
#               ~ KeichiTS - 2023 ~               #
###################################################


