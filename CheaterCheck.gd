extends Sprite2D

func _process(delta: float) -> void:
	if Gamecode.dirty_cheater == true:
		show()
		print("ahah")
	else:
		hide()
