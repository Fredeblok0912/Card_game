extends RichTextLabel


func _process(delta: float) -> void:
	$".".text = "[center]%s[/center]" % str((ceil(Enemycode.enemy_health))as int)
