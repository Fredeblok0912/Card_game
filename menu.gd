extends Node2D

func _on_button_pressed():
	ScreenTransition.load_scene("res://game.tscn")
	Gamecode.gamestart()

func _on_button_2_pressed():
	get_tree().quit()


func _on_button_3_pressed():
		ScreenTransition.load_scene("res://shop.tscn")
