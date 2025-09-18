extends Label

func _process(delta: float) -> void:
	$".".text = "you survived "+ str(Game.Wincounter) +" Rounds"
