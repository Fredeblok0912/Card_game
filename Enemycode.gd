extends Character

var difficulty_mod = 1
var loaded_enemy = 0

var enemy_health = 1
var enemy_max_health = 1
var enemy_shield = 0
var chosen_move

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
	var loaded_enemy_name = enemy_database[loaded_enemy]["name"]
	SpriteControl.set_sprite(loaded_enemy_name)
	enemy_max_health = ceil((enemy_database[loaded_enemy]["health"])*difficulty_mod)
	enemy_health = enemy_max_health
	
func enemy_take_damage(amount):
	for i in amount:
		if not enemy_health > 0:
			Gamecode.enter_shop()
			SpriteControl.EnemyDieSFX()
			break
		else:
			if enemy_shield > 0:
				enemy_shield = enemy_shield -1
			else:
				enemy_health = enemy_health -1
		if not enemy_health > 0:
			Gamecode.enter_shop()
			SpriteControl.EnemyDieSFX()
			break
func enemy_gain_shield(amount):
	enemy_shield = enemy_shield + amount
	
func enemy_regain_health(amount):
	for i in amount:
		if enemy_health != enemy_max_health:
			enemy_health = enemy_health +1

func prepare_action():
	chosen_move = randi_range(0,3)
	enemy_database[loaded_enemy]["moves"][chosen_move]
	
func action():
	if enemy_database[loaded_enemy]["moves"][chosen_move]["damage"] != 0:
		player.take_damage((ceil(enemy_database[loaded_enemy]["moves"][chosen_move]["damage"])*difficulty_mod))
		SpriteControl.PlayerTookDamage()
		await get_tree().create_timer(0.5).timeout
	if enemy_database[loaded_enemy]["moves"][chosen_move]["shield"] != 0:
		enemy_gain_shield((ceil(enemy_database[loaded_enemy]["moves"][chosen_move]["shield"])*difficulty_mod))
		SpriteControl.ShieldUpSFX()
		await get_tree().create_timer(0.5).timeout
	if enemy_database[loaded_enemy]["moves"][chosen_move]["healing"] != 0:
		enemy_regain_health((ceil(enemy_database[loaded_enemy]["moves"][chosen_move]["healing"])*difficulty_mod))
		SpriteControl.HealSFX()
		await get_tree().create_timer(0.5).timeout
			
func Scale_difficulty():
	difficulty_mod = difficulty_mod * 1.05 as float
	print("current difficulty mod is ",difficulty_mod)
