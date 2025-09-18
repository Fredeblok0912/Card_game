extends RichTextLabel


func _process(delta: float) -> void:
	$".".text = "[center]%s[/center]" % player.player_health
