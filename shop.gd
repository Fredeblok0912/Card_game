extends Node2D

func _ready():
	display_cards()

func buy_cards(card_id, price):
	Cardlist.current_decklist.append(card_id)
	Player.

func weighted_randomizer_and_picker()-> Array:
	var basic_cards = []
	var common_cards = []
	var uncommon_cards = []
	var rare_cards = []
	var chosen_cards = []
	for card_id in Cardlist.card_database.keys():
		var rarity = Cardlist.card_database[card_id].get("rarity")
		match rarity:
			0:
				basic_cards.append(card_id)
			1:
				common_cards.append(card_id)
			2:
				uncommon_cards.append(card_id)
			3:
				rare_cards.append(card_id)
	var rarity_dick = {
		0:{"rarity": 0.0},
		1:{"rarity": 0.2},
		2: {"rarity": 0.7},
		3: {"rarity": 0.95},
	}
	for i in range(3):
		var number = randf()
		if number > rarity_dick[3]["rarity"]:
			rare_cards.shuffle()
			var card = rare_cards[0]
			chosen_cards.append(card)
		elif  number > rarity_dick[2]["rarity"]:
			uncommon_cards.shuffle()
			var card = uncommon_cards[0]
			chosen_cards.append(card)
		elif number > rarity_dick[1]["rarity"]:
			common_cards.shuffle()
			var card = common_cards[0]
			chosen_cards.append(card)
		elif number > rarity_dick[0]["rarity"]:
			basic_cards.shuffle()
			var card = basic_cards[0]
			chosen_cards.append(card)
	return chosen_cards		
		
func display_cards():
	var cards_id =Cardlist.card_database.keys()
	cards_id.shuffle()
	var cards = weighted_randomizer_and_picker()
	var spacing = 250
	var start_x_value = -250
	var cardscale = 3
	
	for i in range(cards.size()):
		var card_id = cards[i]
		var card = Area2D.new()
		card.position = Vector2(start_x_value + i * spacing, 0)
		var card_sprite := Sprite2D.new()
		card_sprite.texture = Cardlist.card_sprites_database[card_id]
		card_sprite.scale = Vector2(cardscale,cardscale)
		card_sprite.scale = Vector2(10,10)
		card.add_child(card_sprite)
		var collision = CollisionShape2D.new()
		var shape = RectangleShape2D.new()
		shape.size = card_sprite.texture.get_size() * cardscale
		collision.shape = shape
		card.add_child(collision)
		
		card.input_event.connect(func(viewport, event, shape_idx):
			if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
				print("Bought: ", card_id)
				buy_cards(card_id)
		)
		
		$Cards.add_child(card)
