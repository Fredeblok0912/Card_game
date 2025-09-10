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
	002: {"name": "Slash","cost":2, "damage": 7, "shield": 0, "draw":0, "heal":0, "selfdamage":0,"executionmult":1,"rarity":1},
	003: {"name": "Smash","cost":3, "damage": 12, "shield": 0, "draw":0, "heal":0, "selfdamage":0,"executionmult":1,"rarity":1},
	004: {"name": "Block","cost":2, "damage": 0, "shield": 6, "draw":0, "heal":0, "selfdamage":0,"executionmult":1,"rarity":1},
	005: {"name": "Relax","cost":2, "damage": 0, "shield": 0, "draw":2, "heal":0, "selfdamage":0,"executionmult":1,"rarity":1},
	006: {"name": "Backstab","cost":2, "damage": 9, "shield": 0, "draw":0, "heal":0, "selfdamage":0,"executionmult":1,"rarity":2},
	007: {"name": "Armor Up!","cost":3, "damage": 0, "shield": 9, "draw":0, "heal":0, "selfdamage":0,"executionmult":1,"rarity":2},
	008: {"name": "Quick Jab","cost":1, "damage": 3, "shield": 0, "draw":1, "heal":0, "selfdamage":0,"executionmult":1,"rarity":2},
	010: {"name": "Big Ah Punch","cost":5, "damage": 35, "shield": 0, "draw":0, "heal":0, "selfdamage":0,"executionmult":1,"rarity":3},
	011: {"name": "Singe","cost":1, "damage": 7, "shield": 0, "draw":0, "heal":0, "selfdamage":3,"executionmult":1,"rarity":1},
	012: {"name": "Flamekick","cost":2, "damage": 15, "shield": 0, "draw":0, "heal":0, "selfdamage":5,"executionmult":1,"rarity":1},
	013: {"name": "Combust","cost":3, "damage": 28, "shield": 0, "draw":0, "heal":0, "selfdamage":9,"executionmult":1,"rarity":2},
	015: {"name": "Fireball","cost":2, "damage": 7, "shield": 0, "draw":0, "heal":0, "selfdamage":0,"executionmult":"amount of times you've taken damage this turn [doesnt work yet, this is just a string]","rarity":3},
	016: {"name": "Splash","cost":1, "damage": 1, "shield": 2, "draw":1, "heal":0, "selfdamage":0,"executionmult":1,"rarity":1},
	017: {"name": "Water Cutter","cost":2, "damage": 7, "shield": 0, "draw":1, "heal":0, "selfdamage":0,"executionmult":1,"rarity":1},
	018: {"name": "Ice Blash","cost":3, "damage": 12, "shield": 0, "draw":2, "heal":0, "selfdamage":0,"executionmult":1,"rarity":2},
	019: {"name": "Soda","cost":2, "damage": 0, "shield": 3, "draw":2, "heal":3, "selfdamage":0,"executionmult":1,"rarity":2},
	020: {"name": "Waterfall","cost":2, "damage": 4, "shield": 0, "draw":0, "heal":0, "selfdamage":0,"executionmult":"amount of cards you've drawn this turn [doesnt work yet, this is just a string]","rarity":3},
	021: {"name": "Twin Slice","cost":2, "damage": 4, "shield": 0, "draw":0, "heal":0, "selfdamage":0,"executionmult":2,"rarity":2},
	
}

func _ready():
	# Example usage
	var card_id = 014
	var card = get_card(card_id)
	print("Card:", card["name"], " | Damage:", card["damage"], " | Shield:", card["shield"], " | Draw:", card["draw"], " | Heal:", card["heal"], " | Self Damage:", card["selfdamage"], " | Execution multiplier:", card["executionmult"], " | Rarity:", card["rarity"])

func get_card(id: int) -> Dictionary:
	if card_database.has(id):
		return card_database[id]
	else:
		push_warning("Card ID %s not found!" % str(id))
		return card_database[000]
