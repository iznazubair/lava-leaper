extends CanvasLayer

class_name main_menu

@onready var StartScreen : Node2D = $StartScreen
@onready var StartScreenMusic : AudioStreamPlayer2D = $StartScreen/StartScreenMusic

func _ready():
	StartScreenMusic.play()
	
func update_points(points: int):
	pass
	
func on_game_over():
	StartScreen.visible = true
	
func _on_restart_button_pressed():
	get_tree().reload_current_scene()

func _on_StartButton_pressed():
	StartScreenMusic.stop()
	MainBus._on_request_scene_change("res://Levels/level_1.tscn")
