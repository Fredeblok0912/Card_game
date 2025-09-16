extends Node2D

func _on_button_pressed() -> void:
	end_turn()
	
func end_turn():
	Enemycode.action()
	
	

	
	
	
	
	
	
	
	
	#Start of players next turn, reset energy and draw new cards
	
	Gamecode.draw_cards(2)
	Gamecode.current_energy = 5
	player.player_shield = 0
	Enemycode.enemy_shield = 0
	Enemycode.prepare_action()
