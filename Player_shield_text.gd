extends RichTextLabel


func _process(delta: float) -> void:
	if player.player_shield > 0:
		set_text(str(player.player_shield))
	else:
		set_text("")
