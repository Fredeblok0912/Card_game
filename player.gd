extends Node2D

var player_health = 25
var player_max_health = 25
var player_shield = 0

func take_damage(amount):
	player_health = player_health - amount

func gain_shield(amount):
	player_shield = player_shield + amount
