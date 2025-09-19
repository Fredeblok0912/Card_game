extends Node2D

func _ready():
	Gamecode.clear_hand()
	
func _on_button_pressed() -> void:
	SpriteControl.ButtonclickSFX()
	for child in get_tree().get_root().get_children():
		if child.has_method("reset"):
			child.reset()
	
	ScreenTransition.load_scene("res://menu.tscn")
