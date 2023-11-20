extends State

class_name AirState

@export var ground_state : State
@export var landing_state : State
@export var double_jump_velocity : float = -280
@export var double_jump_animation : String = "doublejump"
@export var landing_animation : String = "jump_end"

var has_double_jumped : bool = false

func state_input(event : InputEvent):
	if(event.is_action_pressed("jump") && !has_double_jumped):
		double_jump()
func on_exit():
	if(next_state == landing_state):
		playback.travel(landing_animation)
		has_double_jumped = false
		

func double_jump():
	character.velocity.y = double_jump_velocity
	playback.travel(double_jump_animation)
	has_double_jumped = true
