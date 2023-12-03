extends State

class_name WallState

@export var jump_velocity : float = -300.0
@export var ground_state : State
@export var air_state : State
@export var return_animation_node : String = "move"

@export var double_jump_velocity : float = -280
var has_double_jumped : bool = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func state_process(delta):
	if(character.is_on_floor()):
		has_double_jumped = false
		next_state = ground_state

	elif(!character.is_near_wall()):
		next_state = air_state
		
	# and ((event.is_action_pressed('left') and character.direction.x > 0) or (event.is_action_pressed('right') and character.direction.x < 0))
#func state_input(event : InputEvent):
#	if event.is_action_pressed('jump') :
#		character.velocity.x = 450 * character.direction.x
#		character.velocity.y = jump_velocity
#		next_state = air_state
func state_input(event: InputEvent):
	# and event.is_action_pressed('jump')
	if character.is_near_wall():
		if (event.is_action_pressed('left') and character.direction.x > 0) or (event.is_action_pressed('right') and character.direction.x < 0):
			character.velocity.x = -450 * character.direction.x
			character.velocity.y = jump_velocity
			next_state = air_state

		
	elif(!character.is_on_floor()):
		if(event.is_action_pressed("jump") && !has_double_jumped):
			double_jump()

	
		
func on_exit():
	if(character.is_on_floor()):
		playback.travel(return_animation_node)

func double_jump():
	character.velocity.y = double_jump_velocity
	playback.travel("doublejump")
	has_double_jumped = true
