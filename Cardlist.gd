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
var decklist = [1,2,2,3,4,4]       		# Det permanente deck som bliver kopieret til hvert combat, er den som man skal add kort til når man køber
var current_decklist = [1,2,2,3,4,4]	# Kort som er i spillerens deck under combat, burde være tom og kopiere inholdet af decklist, men for testing rn er den fyldt
var hand_cards = []						# Kort som er i spillerens hånd


#Just for testing, remove later
func _ready():  
	current_decklist.shuffle()
	print(current_decklist)


#Midlertid kode for at trække kort på input
func _input(event):
	if event.is_action_pressed("ui_up"): 
		draw_cards(1)

#Trækker N antal kort til hånden
func draw_cards(n: int):
	for i in range(n):
		if current_decklist.size() > 0:
			var card_id = current_decklist.pop_front()
			hand_cards.append(card_id)
			#display_card(card_id)
			await get_tree().create_timer(0.3).timeout
			add_card(card_id)
		else:
			#make set the drawpile to contain all cards in the discard pile and wipe the discard pile, then draw the missing cards
			print("Deck is empty!")

#----------------------------------------------------------------------------
#Cards in hand loading sprites

#array for the sprites in hand
var hand_sprites: Array[Sprite2D] = [] 

@export var card_spacing: float = 115.0		#spacing between cards in hand
@export var hand_y: float = 230.0			#how high the cards are on screen
@export var tween_duration: float = 0.35	#how long the card slide in takes
@export var card_scale: float = 2.0			#how large the card sprites are

func add_card(card_id: int) -> void:
	var card_sprite := Sprite2D.new()
	card_sprite.texture = card_sprites_database[card_id]
	card_sprite.scale = Vector2(card_scale, card_scale)
	add_child(card_sprite)
	var viewport_width = get_viewport().get_visible_rect().size.x
	card_sprite.position = Vector2(viewport_width + 200, hand_y)
	
	hand_sprites.append(card_sprite)
	_update_hand_positions()

func _update_hand_positions() -> void:
	var viewport_width = get_viewport().get_visible_rect().size.x
	var total_width = (hand_sprites.size() - 1) * card_spacing
	var start_x = viewport_width / 2 - total_width / 2

	for i in range(hand_sprites.size()):
		var target_x = start_x + i * card_spacing
		var target_pos = Vector2(target_x, hand_y)

		var tween = create_tween()
		tween.tween_property(hand_sprites[i], "position", target_pos, tween_duration).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT)
