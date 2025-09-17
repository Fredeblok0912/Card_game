extends RichTextLabel

func _process(delta: float) -> void:
	if Enemycode.enemy_database[Enemycode.loaded_enemy]["moves"][Enemycode.chosen_move]["healing"] > 0:
		set_text(str((ceil((Enemycode.enemy_database[Enemycode.loaded_enemy]["moves"][Enemycode.chosen_move]["healing"])*Enemycode.difficulty_mod))as int))
	else:
		set_text("")
