extends Node2D

func game_over():
	get_tree().change_scene_to_file("res://game_over.tscn")






func Card_played(ID) -> void:
	print(Cardlist.card_database[ID])
	
	
	
func _ready():  
	Cardlist.current_decklist.shuffle()
	print(Cardlist.current_decklist)


#Midlertid kode for at trække kort på input
func _input(event):
	if event.is_action_pressed("ui_up"): 
		draw_cards(1)

#Trækker N antal kort til hånden
func draw_cards(n: int):
	for i in range(n):
		if Cardlist.current_decklist.size() > 0:
			var card_id = Cardlist.current_decklist.pop_front()
			Cardlist.hand_cards.append(card_id)
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
	card_sprite.texture = Cardlist.card_sprites_database[card_id]

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

func card_played(ID):
	print("played"+Cardlist.hand_cards[ID])
