extends RichTextLabel

func _process(delta: float) -> void:
	if Enemycode.enemy_database[Enemycode.loaded_enemy]["moves"][Enemycode.chosen_move]["shield"] > 0:
		$".".text = "[center]%s[/center]" % str((ceil((Enemycode.enemy_database[Enemycode.loaded_enemy]["moves"][Enemycode.chosen_move]["shield"])*Enemycode.difficulty_mod))as int)
	else:
		set_text("")
