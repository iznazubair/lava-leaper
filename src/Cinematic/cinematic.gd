extends Node2D

func _ready():
	$AnimationPlayer.play("StartingStory")

func _on_animation_player_animation_finished(anim_name):
	get_tree().change_scene_to_file("res://MenuScreens/main_menu.tscn")

func _physics_process(delta):
	if(Input.is_anything_pressed()):
		get_tree().change_scene_to_file("res://MenuScreens/main_menu.tscn")
