extends Node2D

func _ready():
	display_cards()

func display_cards():
	var cards_id =Cardlist.card_database.keys()
	cards_id.shuffle()
	var cards = cards_id.slice(0,3)
	var spacing = 250
	var start_x_value = -250
	
	for i in range(cards.size()):
		var card_id = cards_id[i]
		var card_sprite := Sprite2D.new()
		card_sprite.texture = Cardlist.card_sprites_database[card_id]
		card_sprite.scale = Vector2(10,10)
		card_sprite.position = Vector2(start_x_value + i * spacing, 0)
		$Cards.add_child(card_sprite)
