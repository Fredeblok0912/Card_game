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

func gain_shield(amount):
	player_shield = player_shield + amount
