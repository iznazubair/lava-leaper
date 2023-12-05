extends Area2D

# Speed at which the lava wall moves upward
@export var animation_tree : AnimationTree
@export var collision_shape : CollisionShape2D
@onready var playback
@onready var timer : Timer = $Timer
var move_speed = 50
@export var player : Player

signal player_near_lava
# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.y -= move_speed * delta


#func _on_player_touched_lava():
#	print("Player touched lava!")
	
func _on_body_entered(body):
	print("lava touching player")
	if body.is_in_group("Player"):
#		emit_signal("player_near_lava", body)
		emit_signal("player_near_lava", move_speed)
	
	playback = body.animation_tree["parameters/playback"]
	playback.travel("dead")
	
	body.dead = true
	
	
