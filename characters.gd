extends Node

class_name Character
@onready var gamecode: Node = get_node("/root/Gamecode")

@export var shield: int = 0
@export var sprite: Sprite2D 
@export var health_bar: ProgressBar
@export var money: int = 0
