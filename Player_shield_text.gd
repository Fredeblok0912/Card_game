extends RichTextLabel


func _process(delta: float) -> void:
	if player.player_shield > 0:
			$".".text = "[center]%s[/center]" % player.player_shield
	else:
		set_text("")
