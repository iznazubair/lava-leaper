extends Node2D

@onready var LevelMusic = $"Terrain/LevelMusic"

# Called when the node enters the scene tree for the first time.
func _ready():
	LevelMusic.play()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
