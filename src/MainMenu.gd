extends CanvasLayer

class_name main_menu
signal level_started

@onready var  StartScreen = $StartScreen

func _ready():
	pass
	
func update_points(points: int):
	pass
	
func on_game_over():
	StartScreen.visible = true
	
func _on_restart_button_pressed():
	get_tree().reload_current_scene()


func _on_start_button_pressed():
	pass # Replace with function body.


func _on_button_pressed():
	pass # Replace with function body.
