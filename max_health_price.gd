extends RichTextLabel

func _ready() -> void:
	bbcode_enabled = true

func _process(delta: float) -> void:
	$".".text = "[center]%s[/center]" % str(player.Max_Health_Price)
