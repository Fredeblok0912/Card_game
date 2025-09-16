extends RichTextLabel


func _process(delta: float) -> void:
	set_text(str(player.player_health))
	print(player.player_health)
	
