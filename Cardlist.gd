extends Node

@onready var gamecode = get_node("/root/Gamecode")
@onready var x_cost = gamecode.current_energy as int#x cost spends all of the remaining energy
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
	001: {"name": "Swing","cost":1, "damage": 3, "shield": 0, "draw":0, "heal":0, "selfdamage":0,"executionmult":1,"rarity":1},
	002: {"name": "Slice","cost":2, "damage": 7, "shield": 0, "draw":0, "heal":0, "selfdamage":0,"executionmult":1,"rarity":1},
	003: {"name": "Smash","cost":3, "damage": 12, "shield": 0, "draw":0, "heal":0, "selfdamage":0,"executionmult":1,"rarity":1},
	004: {"name": "Block","cost":2, "damage": 0, "shield": 6, "draw":0, "heal":0, "selfdamage":0,"executionmult":1,"rarity":1},
	005: {"name": "Relax","cost":2, "damage": 0, "shield": 0, "draw":2, "heal":0, "selfdamage":0,"executionmult":1,"rarity":1},
	006: {"name": "Backstab","cost":2, "damage": 9, "shield": 0, "draw":0, "heal":0, "selfdamage":0,"executionmult":1,"rarity":2},
	007: {"name": "Armor Up!","cost":3, "damage": 0, "shield": 9, "draw":0, "heal":0, "selfdamage":0,"executionmult":1,"rarity":2},
	008: {"name": "Quick Jab","cost":1, "damage": 3, "shield": 0, "draw":1, "heal":0, "selfdamage":0,"executionmult":1,"rarity":2},
	009: {"name": "Flurry","cost": x_cost, "damage": 5, "shield": 0, "draw":0, "heal":0, "selfdamage":0,"executionmult":x_cost,"rarity":2},
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
	}

# Etablering af main Deck Arrays
var decklist = [9,9,9,9,1,2,2,3,4,4]       		# Det permanente deck som bliver kopieret til hvert combat, er den som man skal add kort til når man køber
var current_decklist = []	# Kort som er i spillerens deck under combat, burde være tom og kopiere inholdet af decklist, men for testing rn er den fyldt
var hand_cards = []						# Kort som er i spillerens hånd
#Discard should be empty, this is for testing purposes
var discard_pile = []
