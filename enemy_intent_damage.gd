extends Sprite2D

func _process(delta: float) -> void:
	if Enemycode.enemy_database[Enemycode.loaded_enemy]["moves"][Enemycode.chosen_move]["damage"] != 0:
		show()
	else:
		hide()
		
