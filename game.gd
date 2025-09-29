extends Node2D
func _on_button_pressed() -> void:
	SpriteControl.ButtonclickSFX()
	end_turn()
	
	
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
