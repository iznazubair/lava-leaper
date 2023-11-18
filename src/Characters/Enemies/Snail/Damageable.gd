extends Node

class_name Damageable

# creating a signal to emit in hit function
signal on_hit(node : Node, damage_taken : int, knockback_direction : Vector2)

@export var health : float = 20:
	get:
		return health
	set(value):
		SignalBus.emit_signal("on_health_changed", get_parent(), value-health)
		health = value



@export var dead_animation_name : String = "dead"

func hit(damage : int, knockback_direction : Vector2):
	health -= damage
	
	# this signal is emitting the information: who got hit (the parent) and the amount of damage taken
	emit_signal("on_hit", get_parent(), damage, knockback_direction)



func _on_animation_tree_animation_finished(anim_name):
	if(anim_name == dead_animation_name):
		# remove character from game after death animation
		get_parent().queue_free()
