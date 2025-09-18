extends Sprite2D

func _process(delta: float) -> void:
	if player.shield != 0:
		show()
	else:
		hide()
