#A Code by: KeichiTS - 09.2023

extends CharacterBody2D

var vel = Vector2.ZERO

@export var speed : int = 400  # move speed in pixels/sec

func _physics_process(delta: float) -> void:
	move()
	
#Moving the player
func move() -> void:
	####moving player
	var direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity = direction * speed
	
	move_and_slide()

	####changing face
	if velocity.x > 0 and velocity.y == 0:
		rotation = 0
		
	elif velocity.x < 0 and velocity.y == 0:
		rotation = PI
			
	elif velocity.x == 0 and velocity.y > 0:
		rotation = PI/2
			
	elif velocity.x == 0 and velocity.y < 0:
		rotation = -PI/2
			
	elif velocity.x > 0 and velocity.y > 0:
		rotation = PI/4
		
	elif velocity.x > 0 and velocity.y < 0:
		rotation = -PI/4

	elif velocity.x < 0 and velocity.y > 0:
		rotation = 3 * PI / 4
			
	elif velocity.x < 0  and velocity.y < 0:
		rotation = 4 * PI / 3



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



