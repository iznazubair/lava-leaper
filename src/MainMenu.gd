extends CanvasLayer

class_name main_menu

@onready var StartScreen = $StartScreen
@onready var StartScreenMusic = $StartScreen/StartScreenMusic
@onready var level_1 = $"./level_1"
@onready var LevelMusic = $"../Level1/LevelMusic"

func _ready():
	remove_from_group("res://Levels/level_1.tscn")
	LevelMusic.stop()
	StartScreenMusic.play()
	
func update_points(points: int):
	pass
	
func on_game_over():
	StartScreen.visible = true
	
func _on_restart_button_pressed():
	get_tree().reload_current_scene()

func _on_StartButton_pressed():
	StartScreen.visible = false
	StartScreenMusic.stop()
	LevelMusic.play()
#	MainBus._on_request_scene_change(level_1)
