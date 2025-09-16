extends Node2D

var difficulty_mod = 1
var loaded_enemy = 0

var enemy_health = 1
var enemy_max_health = 1
var enemy_shield = 0

var enemy_database = {
	000: {
		"name":"Slime",
		"health":15,
		"moves": [
			{"damage": 5, "shield": 0, "healing": 0},   # Move 1
			{"damage": 8, "shield": 0, "healing": 0},   # Move 2
			{"damage": 0, "shield": 4, "healing": 0},   # Move 3
			{"damage": 0, "shield": 2, "healing": 3}    # Move 4
		]},
	001: {
		"name":"Zombie",
		"health":17,
		"moves": [
			{"damage": 4, "shield": 0, "healing": 2},   # Move 1
			{"damage": 6, "shield": 0, "healing": 3},   # Move 2
			{"damage": 0, "shield": 4, "healing": 0},   # Move 3
			{"damage": 0, "shield": 0, "healing": 5}   # Move 4
]}}

func load_enemy():
	loaded_enemy = randi_range(0,1)
	EnemySprites.set_sprite(loaded_enemy)
	enemy_max_health = (enemy_database[loaded_enemy]["health"])*difficulty_mod
	enemy_health = enemy_max_health
	
func enemy_take_damage(amount):
	for i in amount:
		if enemy_shield != 0:
			enemy_shield = enemy_shield -1
		else:
			enemy_health = enemy_health -1
	if not enemy_health > 0:
		Gamecode.enter_shop()
		
func enemy_gain_shield(amount):
	enemy_shield = enemy_shield + amount
	
func enemy_regain_health(amount):
	for i in amount:
		if enemy_health != enemy_max_health:
			enemy_health = enemy_health +1

func prepare_action():
	var chosen_move = randi_range(0,3)
	var What_move_is_the_enemy_gonna_do = enemy_database[loaded_enemy]["moves"][chosen_move]
	print(What_move_is_the_enemy_gonna_do)
	
func action():
	pass
	
func enemy_damage(action_value):
	pass
			
