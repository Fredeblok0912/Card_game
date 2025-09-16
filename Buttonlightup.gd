extends Area2D

func _ready() -> void:
	$StartbuttonSprite.frame = 0

func _on_mouse_entered():
	$StartbuttonSprite.frame = 1
	
func _on_mouse_exited():
	$StartbuttonSprite.frame = 0
