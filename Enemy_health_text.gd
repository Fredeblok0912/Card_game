extends RichTextLabel


func _process(delta: float) -> void:
	set_text(str((ceil(Enemycode.enemy_health))as int))
	
