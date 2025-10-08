extends AnimatedSprite2D

var Enemy_sprites = ["Slime","Zombie","Boss","Ant"]

func _ready() -> void:
	$".".play("Zombie")
	pass

func set_sprite(chosen):
	pass
	#har brugt to timer på lortet og det virker ikke, vi har en zombie sprite for nu
