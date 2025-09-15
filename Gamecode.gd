extends Node2D


	
func gamestart(): 
	Cardlist.current_decklist.shuffle()
	draw_cards(3)
	
func draw_cards(n: int):
	for i in range(n):
		if Cardlist.current_decklist.size() > 0:
			var card_id = Cardlist.current_decklist.pop_front()
			Cardlist.hand_cards.append(card_id)
			await get_tree().create_timer(0.3).timeout
			print("drew a card")
			add_card(card_id)
		elif Cardlist.current_decklist.size() <= 0 && Cardlist.discard_pile.size() <= 0:
			print("Deck and Discard Pile empty")
		else:
			Cardlist.current_decklist = Cardlist.discard_pile
			Cardlist.discard_pile = []
			var card_id = Cardlist.current_decklist.pop_front()
			Cardlist.hand_cards.append(card_id)
			await get_tree().create_timer(0.3).timeout
			print("shuffled Discard pile into drawpile and drew a card")
			add_card(card_id)
		
#----------------------------------------------------------------------------
#Cards in hand loading sprites

var hand_sprites: Array = []
var card_spacing := 115
var hand_y := 230
var tween_duration := 0.35
var card_scale := 2

func add_card(card_id: int) -> void:
	var card := Area2D.new()
	var card_sprite := Sprite2D.new()
	card_sprite.texture = Cardlist.card_sprites_database[card_id]
	card_sprite.scale = Vector2(card_scale, card_scale)
	card.add_child(card_sprite)

	var collision := CollisionShape2D.new()
	var shape := RectangleShape2D.new()
	shape.size = card_sprite.texture.get_size() * card_sprite.scale
	collision.shape = shape
	card.add_child(collision)

	add_child(card)

	var viewport_width = get_viewport().get_visible_rect().size.x
	card.global_position = Vector2(-viewport_width, hand_y)

	# pass both card_id and the card node
	card.input_event.connect(card_clicked.bind(card_id, card))

	hand_sprites.append(card)
	_update_hand_positions()


func _update_hand_positions() -> void:
	var viewport_width = get_viewport().get_visible_rect().size.x
	var total_width = (hand_sprites.size() - 1) * card_spacing
	var start_x = viewport_width / 2 - total_width / 2
	for i in range(hand_sprites.size()):
		var target_pos = Vector2(start_x + i * card_spacing, hand_y)
		var tween := create_tween()
		tween.tween_property(hand_sprites[i], "global_position", target_pos, tween_duration) \
			.set_trans(Tween.TRANS_SINE) \
			.set_ease(Tween.EASE_OUT)


func card_clicked(_viewport, event, _shape_idx, card_id, card_node):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		card_played(card_id)
		
		# Find index in hand_sprites
		var sprite_index = hand_sprites.find(card_node)
		#move card_id to discard
		Cardlist.discard_pile.append(card_id)
		#clear the played card from Cardlist.hand_cards and hand_sprites
		remove_card(card_id, card_node)
		print("Discard pile now:", Cardlist.discard_pile)

func remove_card(card_id: int, card_node: Area2D) -> void:
	# Remove from hand_sprites (by reference)
	var idx_in_sprites = hand_sprites.find(card_node)
	if idx_in_sprites != -1:
		hand_sprites.remove_at(idx_in_sprites)
		Cardlist.hand_cards.remove_at(idx_in_sprites)
	#Free the node (removes sprite + collision too)
	card_node.queue_free()
	#Move remaining Cards to correct positions
	_update_hand_positions()

func card_played(card_id):
	print("Card played ", card_id)
	
func player_damage():
	

func player_shield():
	
	
func player_heal():
	
	
func player_draw():
	
	
func player_self_damage():
	
	
func 

func _input(event):
	if event.is_action_released("ui_down"):
		draw_cards(1)
	

	
