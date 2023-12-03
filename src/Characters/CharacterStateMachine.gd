extends Node

class_name CharacterStateMachine

@export var current_state : State
@export var character : CharacterBody2D
@export var animation_tree : AnimationTree

var states : Array[State]


# Called when the node enters the scene tree for the first time.
func _ready():
	for child in get_children():
		if (child is State):
			states.append(child)
			
			# Set up each state with the Player CharacterBody2D and animation tree information
			child.character = character
			child.playback = animation_tree["parameters/playback"]
			
			# connect to interrupt signal (in State.gd)
			child.connect("interrupt_state", on_state_interrupt_state)
			
		else:
			push_warning("Child " + child.name + "is not a State for CharacterStateMachine")
	


func check_if_can_move():
	return current_state.can_move
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if(current_state.next_state != null):
		switch_states(current_state.next_state)
		
	# process the new state's logic
	current_state.state_process(delta)
		
func switch_states(new_state : State):
	if(current_state != null):
		# run current state's on exit logic
		current_state.on_exit()
		current_state.next_state = null
		
	# set current state to the new state (passed as argument)
	current_state = new_state
	
	# run new state's 'on entry' logic
	current_state.on_enter()

func _input(event : InputEvent):
	current_state.state_input(event)
	
	
func on_state_interrupt_state(new_state : State):
	switch_states(new_state)
