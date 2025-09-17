extends RichTextLabel


func _process(delta: float) -> void:
	if Enemycode.enemy_shield > 0:
		set_text(str((ceil(Enemycode.enemy_shield))as int))
	else:
		set_text("")
