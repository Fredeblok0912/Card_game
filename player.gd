extends Node2D

var player_health = 25
var player_max_health = 25
var player_shield = 0

func take_damage(amount):
	for i in amount:
		if player_shield != 0:
			player_shield = player_shield -1
		else:
			player_health = player_health - 1
	if not player_health > 0:
		game_over()
		

func gain_shield(amount):
	player_shield = player_shield + amount

func game_over():
	get_tree().change_scene_to_file("res://game_over.tscn")
	
