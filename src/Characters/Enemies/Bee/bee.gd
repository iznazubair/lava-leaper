extends CharacterBody2D

var direction = 1  # 1 for moving down, -1 for moving up
var speed = 100
var interval_timer = 1.3  # time in seconds for each interval
var timer = Timer.new()
@onready var playback
@onready var animation_tree : AnimationTree = $AnimationTree

func _ready():
	animation_tree.active = true
	add_child(timer)
	timer.connect("timeout", _on_timer_timeout)
	timer.wait_time = interval_timer
	timer.start()

func _physics_process(delta):
	velocity.y = direction * speed
	
#	if position.y < 50 or position.y > 550:
#		direction *= -1
		
	move_and_slide()

func _on_timer_timeout():
	direction *= -1  # Change direction at each interval
	timer.start()  # Restart the timer for the next interval

	# Check if the bee reached the screen boundaries and change direction
	





func _on_area_2d_body_entered(body):
	#print("Bee touching player")
	if body.health == 0:
		playback = body.animation_tree["parameters/playback"]
		playback.travel("dead")
	
		body.dead = true
		
	body.health -= 10
	body.isTakingDamage = true
	body.modulate = Color(1, 0, 0)  # Set the color to red
	await get_tree().create_timer(0.5).timeout
	body.modulate = Color(1, 1, 1)  # Reset to the default color
	body.isTakingDamage = false
	
