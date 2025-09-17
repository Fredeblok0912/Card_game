extends Node2D
@onready var label: Label = $Label
var rerolls = 1

var rarity_price = {
	001:{"price":10},
	002:{"price":15},
	003:{"price":20},
}


func _ready():
	display_cards()
	label.text = "Money: " + str(player.money)+"$"
	

func buy_cards(card_id, price):
	if player.money > price:
		Cardlist.decklist.append(card_id)
		player.money -= price
		label.text = "Money: " + str(player.money)
	

func weighted_randomizer_and_picker()-> Array:
	var common_cards = []
	var uncommon_cards = []
	var rare_cards = []
	var chosen_cards = []
	for card_id in Cardlist.card_database.keys():
		var rarity = Cardlist.card_database[card_id].get("rarity")
		match rarity:
			1:
				common_cards.append(card_id)
			2:
				uncommon_cards.append(card_id)
			3:
				rare_cards.append(card_id)
	var rarity_dick = {
		1:{"rarity": 0.0},
		2: {"rarity": 0.65},
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
	return chosen_cards		
		
func display_cards():
	var cards = weighted_randomizer_and_picker()
	var spacing = 250
	var start_x_value = -250
	var cardscale = 3
	
	for i in range(cards.size()):
		var card_id = cards[i]

		var card = Area2D.new()
		card.position = Vector2(start_x_value + i * spacing, 0)
		card.input_pickable = true

		var card_sprite := Sprite2D.new()
		card_sprite.texture = Cardlist.card_sprites_database[card_id]
		card_sprite.scale = Vector2(cardscale, cardscale)
		card.add_child(card_sprite)

		var collision = CollisionShape2D.new()
		var shape = RectangleShape2D.new()
		shape.size = card_sprite.texture.get_size() * card_sprite.scale
		collision.shape = shape
		collision.position = Vector2.ZERO 
		card.add_child(collision)

		var sprite_size = card_sprite.texture.get_size() * card_sprite.scale 

		var price_label := Label.new()

		var rarity = Cardlist.card_database[card_id]["rarity"]
		var price = rarity_price[rarity]["price"]
		price_label.text = str(price)
		price_label.text = str(rarity_price[Cardlist.card_database[card_id]["rarity"]].get("price"),"$")
		price_label.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
		price_label.size_flags_horizontal = Control.SIZE_FILL
		price_label.size = Vector2(sprite_size.x, 20)# grrr jeg fucking hader positionering
		price_label.position = Vector2(-sprite_size.x / 2, sprite_size.y / 2 + 5)

		card.add_child(price_label)



		card.input_event.connect(func(_viewport, event, _shape_idx):
			if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT and player.money > int(Cardlist.card_database[card_id].get("cost")):
				print("Bought: ", card_id)
				buy_cards(card_id, rarity_price[Cardlist.card_database[card_id]["rarity"]].get("price"))
				card.queue_free()
		)

		$Cards.add_child(card)


func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://game.tscn")
	Gamecode.clear_hand()
	Enemycode.Scale_difficulty()
	Enemycode.load_enemy()
	Gamecode.gamestart()


func _on_button2_pressed() -> void:
	if player.money > rerolls:
		player.money -= rerolls
		display_cards()
		rerolls += 1
	
