extends Control

@export var player : Player  # Reference to the player node

func _ready():
	# Assuming you have a Label node named "HealthLabel" in your HUD scene
	$"Digital Counter".text = "Health: "

func _process(delta):
	# Update the health label text dynamically
	$"Digital Counter".text = "Health: " + str(player.health)

