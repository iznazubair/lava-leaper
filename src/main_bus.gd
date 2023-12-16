extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	get_tree().change_scene_to_file("res://Cinematic/cinematic.tscn")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func _on_request_scene_change(scene_path):
	get_tree().change_scene_to_file(scene_path)
