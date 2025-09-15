extends Node2D

func game_over():
	get_tree().change_scene_to_file("res://game_over.tscn")


func Card_played(ID) -> void:
	print(Cardlist.card_database[ID])
	
	
	
