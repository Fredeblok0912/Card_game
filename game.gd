extends Node2D

func _on_button_pressed() -> void:
	SpriteControl.ButtonclickSFX()
	end_turn()
	
	
func end_turn():
	Enemycode.enemy_shield = 0
	Enemycode.action()
	Gamecode.cards_drawn_this_round = 0
	Gamecode.draw_cards(2)
	Gamecode.current_energy = 5
	player.player_shield = 0
	Enemycode.prepare_action()
	Gamecode.self_damage_factor = 1
	Gamecode.self_damage_this_round = 0

var Wincounter = 0

func reset():
	Wincounter = 0
