extends State

class_name AirState

@export var ground_state : State
@export var landing_state : State
@export var wall_state : State
@export var double_jump_velocity : float = -270
@export var double_jump_animation : String = "doublejump"
@export var landing_animation : String = "jump_end"
@export var return_animation_node : String = "move"

var has_double_jumped : bool = false

func state_process(delta):
	if(character.is_on_floor()):
		next_state = landing_state
	elif(character.is_near_wall()):
		next_state = wall_state


func state_input(event : InputEvent):
	if(event.is_action_pressed("jump") && !has_double_jumped):
		double_jump()
		
func on_exit():
	if(next_state == landing_state):
		playback.travel(landing_animation)
		has_double_jumped = false
	elif(next_state == wall_state):
		playback.travel("wall_stick")

func double_jump():
	character.velocity.y = double_jump_velocity
	playback.travel(double_jump_animation)
	has_double_jumped = true
