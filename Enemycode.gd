extends "res://character.gd"
class_name Enemy1

var difficulty_mod = 1

var enemy_sprites = [$Slime_Sprites,$Sprite2D2,$Sprite2D3]

func spawn_enemy():
	var chosen_enemy = randomize_enemy()
	print("enemy chosen is ",chosen_enemy)
	configure_enemy_healthbar(chosen_enemy)
	spawn_enemy_sprite(chosen_enemy)

func randomize_enemy():
	return randi_range(1,1)

func configure_enemy_healthbar(value):
	var bar = $ProgressBar
	var max_health = 15 * difficulty_mod
	bar.max_value = max_health

func spawn_enemy_sprite(chosen_enemy):
	enemy_sprites[chosen_enemy - 1].show()
	sprite.visible = true
	var health_bar = get_node("Character/Enemy/ProgressBar")
	var health = 100
	health_bar.max_value = health
