extends RichTextLabel

func _ready() -> void:
	bbcode_enabled = true

func _process(delta: float) -> void:
	print(player.Reroll_Price)
	$".".text = "[center]%s[/center]" % str(player.Reroll_Price)
