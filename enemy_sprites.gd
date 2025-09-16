extends AnimatedSprite2D

var Enemy_sprites = ["Slime","Zombie"]

func _ready() -> void:
	var randomized_enemy = randi_range(0,1)
	print(randomized_enemy)
	var Current_enemy = Enemy_sprites[randomized_enemy]
	$".".play(Current_enemy)
	
