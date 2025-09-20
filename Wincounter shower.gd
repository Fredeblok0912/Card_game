extends RichTextLabel

func _ready() -> void:
	bbcode_enabled = true

func _process(delta: float) -> void:
	$".".scale = Vector2(2, 2)
	$".".text = "[center]%s[/center]" % str(Game.Wincounter)
