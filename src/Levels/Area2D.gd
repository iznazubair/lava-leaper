extends Area2D

# Speed at which the lava wall moves upward
var move_speed = 50

# Called when the node enters the scene tree for the first time.
func _ready():
	# connect("body_entered", self, "_on_body_entered")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# Move the lava wall upward
	position.y -= move_speed * delta





func _on_body_entered(body):
	print("lava touching player")
