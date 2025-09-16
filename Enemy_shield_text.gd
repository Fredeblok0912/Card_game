extends RichTextLabel


func _process(delta: float) -> void:
	if Enemycode.enemy_shield > 0:
		set_text(str(Enemycode.enemy_shield))
	else:
		set_text("")
