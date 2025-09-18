extends Sprite2D

func _process(delta: float) -> void:
	if Enemycode.enemy_shield > 0:
		show()
	else:
		hide()
