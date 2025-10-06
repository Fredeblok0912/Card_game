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
	001: {"name": "Swing","cost":1, "damage": 3, "shield": 0, "draw":0, "heal":0, "selfdamage":0,"executionmult":1,"rarity":1,"energy_regain":0},
	002: {"name": "Slice","cost":2, "damage": 7, "shield": 0, "draw":0, "heal":0, "selfdamage":0,"executionmult":1,"rarity":1,"energy_regain":0},
	003: {"name": "Smash","cost":3, "damage": 12, "shield": 0, "draw":0, "heal":0, "selfdamage":0,"executionmult":1,"rarity":1,"energy_regain":0},
	004: {"name": "Block","cost":2, "damage": 0, "shield": 6, "draw":0, "heal":0, "selfdamage":0,"executionmult":1,"rarity":1,"energy_regain":0},
	005: {"name": "Relax","cost":2, "damage": 0, "shield": 0, "draw":2, "heal":0, "selfdamage":0,"executionmult":1,"rarity":1,"energy_regain":0},
	006: {"name": "Backstab","cost":2, "damage": 9, "shield": 0, "draw":0, "heal":0, "selfdamage":0,"executionmult":1,"rarity":2,"energy_regain":0},
	007: {"name": "Armor Up!","cost":3, "damage": 0, "shield": 11, "draw":0, "heal":0, "selfdamage":0,"executionmult":1,"rarity":2,"energy_regain":0},
	008: {"name": "Quick Jab","cost":1, "damage": 3, "shield": 0, "draw":1, "heal":0, "selfdamage":0,"executionmult":1,"rarity":2,"energy_regain":0},
	009: {"name": "Flurry","cost": 0, "damage": 5, "shield": 0, "draw":0, "heal":0, "selfdamage":0,"executionmult":1,"rarity":2,"energy_regain":0},
	010: {"name": "Deathblow","cost":5, "damage": 35, "shield": 0, "draw":0, "heal":0, "selfdamage":0,"executionmult":1,"rarity":3,"energy_regain":0},
	011: {"name": "Singe","cost":1, "damage": 7, "shield": 0, "draw":0, "heal":0, "selfdamage":3,"executionmult":1,"rarity":1,"energy_regain":0},
	012: {"name": "Flamekick","cost":2, "damage": 15, "shield": 0, "draw":0, "heal":0, "selfdamage":5,"executionmult":1,"rarity":1,"energy_regain":0},
	013: {"name": "Combust","cost":3, "damage": 27, "shield": 0, "draw":0, "heal":0, "selfdamage":9,"executionmult":1,"rarity":2,"energy_regain":0},
	014: {"name": "Bellow","cost":2, "damage": 0, "shield": 0, "draw":0, "heal":0, "selfdamage":0,"executionmult":1,"rarity":2,"energy_regain":0},
	015: {"name": "Fireball","cost":2, "damage": 7, "shield": 0, "draw":0, "heal":0, "selfdamage":0,"executionmult":1,"rarity":3,"energy_regain":0},
	016: {"name": "Splash","cost":1, "damage": 1, "shield": 2, "draw":1, "heal":0, "selfdamage":0,"executionmult":1,"rarity":1,"energy_regain":0},
	017: {"name": "Water Cut","cost":2, "damage": 7, "shield": 0, "draw":1, "heal":0, "selfdamage":0,"executionmult":1,"rarity":1,"energy_regain":0},
	018: {"name": "Ice Blash","cost":3, "damage": 12, "shield": 0, "draw":2, "heal":0, "selfdamage":0,"executionmult":1,"rarity":2,"energy_regain":0},
	019: {"name": "Soda","cost":2, "damage": 0, "shield": 3, "draw":2, "heal":3, "selfdamage":0,"executionmult":1,"rarity":2,"energy_regain":0},
	020: {"name": "Waterfall","cost":2, "damage": 4, "shield": 0, "draw":0, "heal":0, "selfdamage":0,"executionmult":1,"rarity":3,"energy_regain":0},
	021: {"name": "Dual Slash","cost":2, "damage": 4, "shield": 0, "draw":0, "heal":0, "selfdamage":0,"executionmult":2,"rarity":2,"energy_regain":0},
	022: {"name": "Grass Cut","cost":2, "damage": 5, "shield": 0, "draw":0, "heal":0, "selfdamage":0,"executionmult":1,"rarity":1,"energy_regain":1},
	023: {"name": "Barkskin","cost":3, "damage": 0, "shield": 9, "draw":0, "heal":0, "selfdamage":0,"executionmult":1,"rarity":1,"energy_regain":1},
	024: {"name": "Algae","cost":2, "damage": 0, "shield": 0, "draw":0, "heal":5, "selfdamage":0,"executionmult":1,"rarity":2,"energy_regain":1},
	025: {"name": "Rest","cost":3, "damage": 0, "shield": 0, "draw":0, "heal":0, "selfdamage":0,"executionmult":1,"rarity":2,"energy_regain":5},
	026: {"name": "Solar Beam","cost":2, "damage": 5, "shield": 0, "draw":0, "heal":0, "selfdamage":0,"executionmult":1,"rarity":3,"energy_regain":0},
	027: {"name": "Syphon","cost":2, "damage": 5, "shield": 0, "draw":0, "heal":2, "selfdamage":0,"executionmult":1,"rarity":1,"energy_regain":0},
	028: {"name": "Holy Block","cost":1, "damage": 0, "shield": 2, "draw":0, "heal":2, "selfdamage":0,"executionmult":1,"rarity":1,"energy_regain":0},
	029: {"name": "Holy Light","cost":3, "damage": 0, "shield": 0, "draw":0, "heal":11, "selfdamage":0,"executionmult":1,"rarity":2,"energy_regain":0},
	030: {"name": "Blessing","cost":3, "damage": 0, "shield": 7, "draw":2, "heal":7, "selfdamage":0,"executionmult":1,"rarity":2,"energy_regain":0},
	031: {"name": "Genesis","cost":3, "damage": 9, "shield": 0, "draw":0, "heal":19, "selfdamage":0,"executionmult":1,"rarity":3,"energy_regain":0},
	
}
#Liste over alle kort sprites
var card_sprites_database = {
	000:preload("res://Art/Cards/000 Cardback.png"),
	001:preload("res://Art/Cards/001 Swing.png") ,
	002:preload("res://Art/Cards/002 Slice.png") ,
	003:preload("res://Art/Cards/003 Smash.png") ,
	004:preload("res://Art/Cards/004 Block.png") ,
	005:preload("res://Art/Cards/005 Relax.png") ,
	006:preload("res://Art/Cards/006 Backstab.png") ,
	007:preload("res://Art/Cards/007 Armor Up!.png") ,
	008:preload("res://Art/Cards/008 Quick Jab.png") ,
	009:preload("res://Art/Cards/009 Flurry.png") ,
	010:preload("res://Art/Cards/010 Deathblow.png") ,
	011:preload("res://Art/Cards/011 Singe.png") ,
	012:preload("res://Art/Cards/012 Flamekick.png") ,
	013:preload("res://Art/Cards/013 Combust.png") ,
	014:preload("res://Art/Cards/014 Bellow.png") ,
	015:preload("res://Art/Cards/015 Fireball.png") ,
	016:preload("res://Art/Cards/016 Splash.png") ,
	017:preload("res://Art/Cards/017 Water Cut.png") ,
	018:preload("res://Art/Cards/018 Ice Blast.png") ,
	019:preload("res://Art/Cards/019 Soda.png") ,
	020:preload("res://Art/Cards/020 Waterfall.png") ,
	021:preload("res://Art/Cards/021 Dual Slash.png") ,
	022:preload("res://Art/Cards/022 Grass Cut.png") ,
	023:preload("res://Art/Cards/023 Barkskin.png") ,
	024:preload("res://Art/Cards/024 Algae.png") ,
	025:preload("res://Art/Cards/025 Rest.png") ,
	026:preload("res://Art/Cards/026 Solar Beam.png") ,
	027:preload("res://Art/Cards/027 Syphon.png") ,
	028:preload("res://Art/Cards/028 Holy Block.png") ,
	029:preload("res://Art/Cards/029 Holy Light.png") ,
	030:preload("res://Art/Cards/030 Blessing.png") ,
	031:preload("res://Art/Cards/031 Genesis.png") ,
	}

# Etablering af main Deck Arrays
var decklist = [1,2,2,3,4,4,26]       		# Det permanente deck som bliver kopieret til hvert combat, er den som man skal add kort til når man køber
var current_decklist = []	# Kort som er i spillerens deck under combat, burde være tom og kopiere inholdet af decklist, men for testing rn er den fyldt
var hand_cards = []						# Kort som er i spillerens hånd
#Discard should be empty
var discard_pile = []

func reset():
	decklist = [1,2,2,3,4,4]
	current_decklist = []
	hand_cards = []
	discard_pile = []
