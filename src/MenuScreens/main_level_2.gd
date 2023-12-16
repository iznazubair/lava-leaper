extends CanvasLayer

class_name main_level_2

@onready var StartScreen : Node2D = $StartScreen
@onready var StartScreenMusic : AudioStreamPlayer2D = $StartScreen/StartScreenMusic

func _ready():
	pass
	
func update_points(points: int):
	pass
	
func on_game_over():
	StartScreen.visible = true
	
func _on_restart_button_pressed():
	get_tree().reload_current_scene()

func _on_start_button_pressed():
	StartScreenMusic.stop()
	MainBus._on_request_scene_change("res://Levels/level_2.tscn")
