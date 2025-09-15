extends Node2D
class_name Character

@export var health: int = 100
@export var max_health: int = 100
@export var shield: int = 0
@export var sprite: Sprite2D 
@export var health_bar: ProgressBar
		
	
func hide_sprite():
	sprite.hide()
	
func die():
	queue_free()
	
func _ready():
	if not sprite and has_node("Sprite2D"):
		sprite = $Sprite2D
