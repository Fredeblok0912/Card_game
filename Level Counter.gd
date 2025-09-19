extends RichTextLabel

func _physics_process(delta: float) -> void:
	$".".text = "level " + str(Gamecode.Level)
