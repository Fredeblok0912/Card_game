extends Node2D

var current_energy = 0 as int

func _process(delta: float):
	pass
	
func gamestart(): 
	Cardlist.current_decklist = Cardlist.decklist.duplicate()
	Cardlist.discard_pile.clear()
	clear_hand()
	_update_hand_positions()
	Cardlist.current_decklist.shuffle()
	draw_cards(3)
	current_energy = 5
	Enemycode.prepare_action()
	Enemycode.load_enemy()
	
	
func draw_cards(n: int):
	if not Cardlist.hand_cards.size() >= 7:
		for i in range(n):
			if Cardlist.current_decklist.size() > 0:
				var card_id = Cardlist.current_decklist.pop_front()
				Cardlist.hand_cards.append(card_id)
				await get_tree().create_timer(0.3).timeout
				add_card(card_id)
			elif Cardlist.current_decklist.size() <= 0 && Cardlist.discard_pile.size() <= 0:
				print("Deck and Discard Pile empty")
			else:
				Cardlist.current_decklist = Cardlist.discard_pile.duplicate()
				Cardlist.discard_pile.clear()
				Cardlist.current_decklist.shuffle()
				var card_id = Cardlist.current_decklist.pop_front()
				Cardlist.hand_cards.append(card_id)
				await get_tree().create_timer(0.3).timeout
				print("shuffled Discard pile into drawpile and drew a card")
				add_card(card_id)
#----------------------------------------------------------------------------
#Cards in hand loading sprites

var hand_sprites: Array = []
var card_spacing := 235
var hand_y := 300
var tween_duration := 0.35
var card_scale := 4

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
	var n = hand_sprites.size()
	if n == 0:
		return
	var span = (n - 1) * card_spacing
	var first_center_x = viewport_width * 0.5 - span * 0.5 - 385

	for i in range(n):
		var center_x = first_center_x + i * card_spacing
		var target_pos = Vector2(center_x, hand_y)
		var tween = create_tween()
		tween.tween_property(hand_sprites[i], "global_position", target_pos, tween_duration) \
			.set_trans(Tween.TRANS_SINE) \
			.set_ease(Tween.EASE_OUT)


func card_clicked(_viewport, event, _shape_idx, card_id, card_node):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		var cardcost = Cardlist.card_database[card_id].get("cost") as int
		if cardcost <= current_energy:
			card_played(card_id)
			Cardlist.discard_pile.append(card_id)
			remove_card_on_click(card_id, card_node)
			if card_id == 009:
				current_energy = 0
			current_energy = current_energy - cardcost
		else:
			print("card too expensive")
func remove_card_on_click(card_id: int, card_node: Area2D) -> void:
	var index = hand_sprites.find(card_node)
	hand_sprites.remove_at(index)
	Cardlist.hand_cards.remove_at(index)
	card_node.queue_free()
	_update_hand_positions()

func card_played(card_id):
	var card_name = Cardlist.card_database[card_id].get("name")
	var card_mult = Cardlist.card_database[card_id].get("executionmult")
	player_damage(card_id,card_name,card_mult)
	player_shield(card_id,card_name,card_mult)
	player_heal(card_id,card_name,card_mult)
	player_draw(card_id,card_name,card_mult)	
	player_self_damage(card_id,card_name,card_mult)
	
func player_damage(card_id,card_name,card_mult):
	var played_card_damage = Cardlist.card_database[card_id].get("damage")
	if played_card_damage != 0:
		if card_id == 009: 
			print(current_energy)
			for i in current_energy:
				if not Enemycode.enemy_health < 0:
					Enemycode.enemy_take_damage(played_card_damage)
					await get_tree().create_timer(0.2).timeout
		else:
			for i in card_mult:
				if not Enemycode.enemy_health < 0:
					Enemycode.enemy_take_damage(played_card_damage)
					await get_tree().create_timer(0.2).timeout

func player_shield(card_id,card_name,card_mult):
	var played_card_shield = Cardlist.card_database[card_id].get("shield")
	if played_card_shield != 0:
		for i in range(card_mult):
#			print(card_name," gains the player ", played_card_shield, " shield")
			player.gain_shield(played_card_shield)
	
func player_heal(card_id,card_name,card_mult):
	var played_card_heal = Cardlist.card_database[card_id].get("heal")
	if played_card_heal != 0:
		for i in range(card_mult):
#			print(card_name," heals the player for ", played_card_heal, " health")
			player.regain_health(played_card_heal)
	
func player_draw(card_id,card_name,card_mult):
	var played_card_draw = Cardlist.card_database[card_id].get("draw")
	if played_card_draw != 0:
		for i in range(card_mult):
#			print(card_name," drew the player ", played_card_draw, " cards")
			draw_cards(played_card_draw)	
	
func player_self_damage(card_id,card_name,card_mult):
	var played_card_self_damage = Cardlist.card_database[card_id].get("selfdamage")
	if played_card_self_damage != 0:
		for i in range(card_mult):
#			print(card_name," deals ", played_card_self_damage, " damage to the player")
			player.take_damage(played_card_self_damage)
	
func _input(event):
	if event.is_action_released("ui_down"):
		draw_cards(1)
	if event.is_action_released("ui_up"):
		current_energy = current_energy +1

func enter_shop():
	player.money += ceil(10 * Enemycode.difficulty_mod)
	Enemycode.Scale_difficulty()
	ScreenTransition.load_scene("res://shop.tscn")
	

func clear_hand() -> void:
	for card in hand_sprites:
		if is_instance_valid(card):
			card.queue_free()
			print("Clearing card:", card.name)
	hand_sprites.clear()
	Cardlist.hand_cards.clear()
