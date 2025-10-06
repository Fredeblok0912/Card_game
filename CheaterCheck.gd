extends Sprite2D

func _process(delta: float) -> void:
	if Gamecode.dirty_cheater == true:
		show()
	else:
		hide()
