extends RichTextLabel


func _process(delta: float) -> void:
	if Enemycode.enemy_shield > 0:
		$".".text = "[center]%s[/center]" % str((ceil(Enemycode.enemy_shield))as int)
	else:
		set_text("")
