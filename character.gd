extends Node2D
class_name Character
@onready var gamecode: Node = get_node("/root/Gamecode")

@export var health: int = 100
@export var max_health: int = 100
@export var shield: int = 0
@export var sprite: Sprite2D 
@export var health_bar: ProgressBar
		
# temporary 
func hide_sprite():
	sprite.hide()
	
func die():
	queue_free()
	
func set_health(value: int):
	health = clamp(value, 0, max_health)
	if health_bar:
		health_bar.value = health	

func add_shield(value: int):
	shield = value

#func move_player():
	#var center = gamecode.get_hand_center()
	#sprite.global_position = center + Vector2(-450,-450)
	

func _ready():
	if not sprite and has_node("Sprite2D"):
		sprite = $Sprite2D
		
