extends Area2D

func _on_coin_body_entered(body):
	$AnimationPlayer.play("bounce")
	body.add_coin()

func _on_animation_player_animation_finished(anim_name):
	queue_free()
