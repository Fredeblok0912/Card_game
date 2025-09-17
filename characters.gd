extends Node

class_name Character
@onready var gamecode: Node = get_node("/root/Gamecode")

@export var health: int = 100
@export var max_health: int = 100
@export var shield: int = 0
@export var sprite: Sprite2D 
@export var health_bar: ProgressBar
@export var money: int = 0
		#

func set_health(value: int):
	health = clamp(value, 0, max_health)
	if health_bar:
		health_bar.value = health	

func add_shield(value: int):
	shield = value
