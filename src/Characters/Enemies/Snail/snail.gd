extends CharacterBody2D

const SLOWSPEED = 100.0
@onready var animation_tree : AnimationTree = $AnimationTree

@export var starting_move_direction : Vector2 = Vector2.LEFT
@export var movement_speed : float = 30.0

@export var hit_state : State 

@onready var state_machine : CharacterStateMachine = $CharacterStateMachine
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

# Add a timer for flipping direction
var flip_timer := Timer.new()
var flip_interval := 3.0

func _ready():
	animation_tree.active = true
	add_child(flip_timer)
	flip_timer.wait_time = flip_interval

	# Connect the timeout signal directly on the Timer node
	flip_timer.connect("timeout", _on_flip_timer_timeout)

	# Start the timer
	flip_timer.start()

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	var direction : Vector2 = starting_move_direction
	if direction && state_machine.check_if_can_move():
		velocity.x = direction.x * movement_speed
	elif state_machine.current_state != hit_state:
		velocity.x = move_toward(velocity.x, 0, movement_speed)
	
	move_and_slide()
	
func _on_flip_timer_timeout():
	starting_move_direction.x *= -1  # Flip the direction
	scale.x *= -1
	flip_timer.start()  # Restart the timer


func _on_area_2d_body_entered(body):
	if body.is_in_group('Player'):
		body.speed = SLOWSPEED


func _on_area_2d_body_exited(body):
	if body.is_in_group('Player'):
		body.speed = 250
