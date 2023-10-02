#A Code by: KeichiTS - 09.2023

extends CharacterBody2D

var vel = Vector2.ZERO
var rotatio_speed := 2.0

@export var speed : int = 300  # move speed in pixels/sec
@export var acelleration := 10

func _physics_process(delta: float) -> void:
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

	
#	if velocity.x > 0 and velocity.y == 0:
#		rotation = 0
#
#	elif velocity.x < 0 and velocity.y == 0:
#		rotation = PI
#
#	elif velocity.x == 0 and velocity.y > 0:
#		rotation = PI/2
#
#	elif velocity.x == 0 and velocity.y < 0:
#		rotation = -PI/2
#
#	elif velocity.x > 0 and velocity.y > 0:
#		rotation = PI/4
#
#	elif velocity.x > 0 and velocity.y < 0:
#		rotation = -PI/4
#
#	elif velocity.x < 0 and velocity.y > 0:
#		rotation = 3 * PI / 4
#
#	elif velocity.x < 0  and velocity.y < 0:
#		rotation = 4 * PI / 3



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



