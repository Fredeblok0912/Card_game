extends Node

# Kort Database som en dictionary
# cost = the amount of energy the card costs
# damage = how much damage the card deals to the enemy
# shield = how much shield the player gets as overhealth
# draw = how many cards the player draws to their hand
# heal = how much the health the player regains from the card
# selfdamage = how much health the player losses when playing the card
# executionmult = how many times all other stats are applied (an execution stat of 2 makes damage, shield, draw, heal and selfdamage apply that many times)
# rarity = what rarity the card is
var card_database = {
	000: {"name": "Null","cost":0, "damage": 0, "shield": 0, "draw":0, "heal":0, "selfdamage":0,"executionmult":0,"rarity":0},
	001: {"name": "Swing","cost":1, "damage": 3, "shield": 0, "draw":0, "heal":0, "selfdamage":0,"executionmult":1,"rarity":1},
	002: {"name": "Slice","cost":2, "damage": 7, "shield": 0, "draw":0, "heal":0, "selfdamage":0,"executionmult":1,"rarity":1},
	003: {"name": "Smash","cost":3, "damage": 12, "shield": 0, "draw":0, "heal":0, "selfdamage":0,"executionmult":1,"rarity":1},
	004: {"name": "Block","cost":2, "damage": 0, "shield": 6, "draw":0, "heal":0, "selfdamage":0,"executionmult":1,"rarity":1},
	005: {"name": "Relax","cost":2, "damage": 0, "shield": 0, "draw":2, "heal":0, "selfdamage":0,"executionmult":1,"rarity":1},
	006: {"name": "Backstab","cost":2, "damage": 9, "shield": 0, "draw":0, "heal":0, "selfdamage":0,"executionmult":1,"rarity":2},
	007: {"name": "Armor Up!","cost":3, "damage": 0, "shield": 9, "draw":0, "heal":0, "selfdamage":0,"executionmult":1,"rarity":2},
	008: {"name": "Quick Jab","cost":1, "damage": 3, "shield": 0, "draw":1, "heal":0, "selfdamage":0,"executionmult":1,"rarity":2},
	009: {"name": "Flurry","cost":"all remaining energy", "damage": 5, "shield": 0, "draw":0, "heal":0, "selfdamage":0,"executionmult":"amount of energy spent","rarity":2},
	010: {"name": "Deathblow","cost":5, "damage": 35, "shield": 0, "draw":0, "heal":0, "selfdamage":0,"executionmult":1,"rarity":3},
	011: {"name": "Singe","cost":1, "damage": 7, "shield": 0, "draw":0, "heal":0, "selfdamage":3,"executionmult":1,"rarity":1},
	012: {"name": "Flamekick","cost":2, "damage": 15, "shield": 0, "draw":0, "heal":0, "selfdamage":5,"executionmult":1,"rarity":1},
	013: {"name": "Combust","cost":3, "damage": 27, "shield": 0, "draw":0, "heal":0, "selfdamage":9,"executionmult":1,"rarity":2},
	015: {"name": "Fireball","cost":2, "damage": "7 + selfdamage", "shield": 0, "draw":0, "heal":0, "selfdamage":0,"executionmult":1,"rarity":3},
	016: {"name": "Splash","cost":1, "damage": 1, "shield": 2, "draw":1, "heal":0, "selfdamage":0,"executionmult":1,"rarity":1},
	017: {"name": "Water Cut","cost":2, "damage": 7, "shield": 0, "draw":1, "heal":0, "selfdamage":0,"executionmult":1,"rarity":1},
	018: {"name": "Ice Blash","cost":3, "damage": 12, "shield": 0, "draw":2, "heal":0, "selfdamage":0,"executionmult":1,"rarity":2},
	019: {"name": "Soda","cost":2, "damage": 0, "shield": 3, "draw":2, "heal":3, "selfdamage":0,"executionmult":1,"rarity":2},
	020: {"name": "Waterfall","cost":2, "damage": 4, "shield": 0, "draw":0, "heal":0, "selfdamage":0,"executionmult":"amount of cards you've drawn this turn [doesnt work yet, this is just a string]","rarity":3},
	021: {"name": "Dual Slash","cost":2, "damage": 4, "shield": 0, "draw":0, "heal":0, "selfdamage":0,"executionmult":2,"rarity":2},
	
}

# Main collections
var decklist = [1,2,2,3,4,4]        # permanent deck definition (card IDs)
var current_decklist = [] # mutable draw pile
var hand = []             # cards in your hand

func _input(event):
	if event.is_action_pressed("ui_down"): 
		# Start game -> shuffle deck into current_decklist
		current_decklist = decklist.duplicate()
		current_decklist.shuffle()
		hand.clear()
		print("Game started, current deck:", current_decklist)

	elif event.is_action_pressed("ui_up"): 
		# Draw 3 cards into hand
		draw_cards(2)
		print("Hand now:", hand)

#Function draws N cards to hand
func draw_cards(n: int):
	for i in range(n):
		if current_decklist.size() > 0:
			var card_id = current_decklist.pop_front()
			hand.append(card_id)
			display_card(card_id)
		else:
			print("Deck is empty!")

func display_card(card_id: int):
	var card = card_database[card_id]
	var card_name = card["name"]
	print("Drew card:", card_name)
