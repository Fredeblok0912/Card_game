extends RichTextLabel


func _process(delta: float) -> void:
	set_text(str(Enemycode.enemy_health))
	
