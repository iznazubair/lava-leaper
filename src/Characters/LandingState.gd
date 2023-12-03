extends State

class_name LandingState

@export var landing_animation : String = "jump_end"
@export var ground_state : State

func state_process(delta):
	# _on_animation_tree_animation_finished(landing_animation)
	pass

func _on_animation_tree_animation_finished(anim_name):
	if(anim_name == landing_animation):
		next_state = ground_state
