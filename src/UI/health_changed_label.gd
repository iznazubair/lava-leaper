extends Label

@export var float_speed : Vector2 = Vector2(0, -30)
@onready var timer : Timer = $Timer

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# make the text float up
	position += float_speed * delta


func _on_timer_timeout():
	queue_free()
