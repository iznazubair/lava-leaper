extends CharacterBody2D

class_name Player

@export var speed : float = 250.0
var starting_pos : Vector2 = Vector2(0,155)

@onready var animation_tree : AnimationTree = $AnimationTree
@onready var animation_player : AnimationPlayer = $AnimationPlayer
@onready var sprite : Sprite2D = $Sprite2D
@onready var state_machine : CharacterStateMachine = $CharacterStateMachine

@export var game_over_timer : Timer
# Get the gravity from the project settings to be synced with RigidBody nodes.
var dead : bool = false
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var direction : Vector2 = Vector2.ZERO
@export var coins = 0

var near_lava : bool = false
var isTakingDamage : bool = false
var lava_speed = 0  # Variable to store the lava speed

#var max_hearts : int = 2
#var hearts : float = max_hearts

var health = 30

signal facing_direction_changed(facing_right : bool)
signal life_changed(player_hearts)



func _ready():
	position = starting_pos
	animation_tree.active = true
	add_to_group("Player")
	# connect("player_near_lava", is_near_lava)
	
func _physics_process(delta):
	if dead:
		game_over()

	# Add the gravity.
	else: 
		if not is_on_floor():
			if state_machine.current_state is AirState:
				velocity.y += gravity * delta
			elif state_machine.current_state is WallState:
				velocity.y = clamp(velocity.y + gravity * delta, -270, 100)

			
		# Get the input direction and handle the movement/deceleration.
		direction = Input.get_vector("left", "right", "up", "down")
		if direction.x != 0 && state_machine.check_if_can_move():
			velocity.x = direction.x * speed
		else:
			velocity.x = move_toward(velocity.x, 0, speed)

		move_and_slide()
		update_animation_parameters()
		update_facing_direction()
	

func is_near_wall():
	return $Wallchecker.is_colliding()
	
func update_animation_parameters():
	animation_tree.set("parameters/move/blend_position", direction.x)

func update_facing_direction():
	if direction.x < 0:
		sprite.flip_h = true
		$Wallchecker.rotation_degrees = 90
	elif direction.x > 0:
		sprite.flip_h = false
		$Wallchecker.rotation_degrees = -90

	emit_signal("facing_direction_changed", !sprite.flip_h)
	
func add_coin():
	coins += 1
	if coins >= 6:
		if get_tree().current_scene.scene_file_path == "res://Levels/level_1.tscn":
			get_tree().change_scene_to_file("res://MenuScreens/main_level_2.tscn")
		elif get_tree().current_scene.scene_file_path == "res://Levels/level_2.tscn":
			get_tree().change_scene_to_file("res://MenuScreens/main_level_3.tscn")

func game_over():
	state_machine.current_state.can_move = false
	
	await get_tree().create_timer(5.0).timeout
	queue_free()
	# Reload the current scene
	get_tree().reload_current_scene()


