extends Node2D





func _on_button_pressed():
	get_tree().change_scene_to_file("res://game.tscn")
#hello hello

func _on_button_2_pressed():
	get_tree().quit()
