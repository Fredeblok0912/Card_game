extends Node2D

func _on_button_pressed():
	SpriteControl.ButtonclickSFX()
	ScreenTransition.load_scene("res://game.tscn")
	Gamecode.gamestart()

func _on_button_2_pressed():
	SpriteControl.ButtonclickSFX()
	get_tree().quit()


func _on_button_3_pressed():
	SpriteControl.ButtonclickSFX()
	ScreenTransition.load_scene("res://shop.tscn")
