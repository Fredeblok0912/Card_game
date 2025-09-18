extends Character 
class_name Player

var player_health = 0
var player_max_health = 0
var player_shield = 0

func _ready() -> void:
	player_health = 25
	player_max_health = 25

func take_damage(amount):
	print("This take_damage is running on: ", name, " path: ", get_path())
	for i in amount:
		if player_shield != 0:
			player_shield = player_shield -1
		else:
			player_health = player_health -1
	if not player_health > 0:
		game_over()
		
func gain_shield(amount):
	player_shield = player_shield + amount
	
func regain_health(amount):
	for i in amount:
		if player_health != player_max_health:
			player_health = player_health +1

func game_over():
	Gamecode.clear_hand()
	ScreenTransition.load_scene("res://game_over.tscn")
	
