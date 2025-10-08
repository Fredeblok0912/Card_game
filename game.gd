extends Node2D
var turn_ending = false
const Settings = preload("res://settings.tscn")


func _on_button_pressed() -> void:
	if turn_ending == false:
		SpriteControl.ButtonclickSFX()
		turn_ending = true
		end_turn()
		await get_tree().create_timer(0.5).timeout
		turn_ending = false
	else:
		SpriteControl.CantDoActionSFX()
	
func end_turn():
	Gamecode.queue_action(func() -> void:
		Enemycode.enemy_shield = 0
		Enemycode.action()
		Gamecode.cards_drawn_this_round = 0
		Gamecode.cards_played_this_round = 0
		await Gamecode.draw_cards(2) # still async
		Gamecode.current_energy = 5
		player.player_shield = 0
		Enemycode.prepare_action()
		Gamecode.self_damage_factor = 1
		Gamecode.self_damage_this_round = 0
	)
	


var Wincounter = 0

func reset():
	Wincounter = 0


func _on_button_settings_pressed():
	var sprite_instance = Settings.instantiate()
	add_child(sprite_instance)
	sprite_instance.position = Vector2(-300,-550)
	
