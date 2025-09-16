extends "res://character.gd"
class_name Enemy1



func _ready():
	hide_sprite()


func spawn_enemy(value):
	var sprite = get_node("Character/Enemy/Sprite2D%d" % value)
	sprite.visible = true
	var health_bar = get_node("Character/Enemy/ProgressBar")
	var health = 100
	health_bar.max_value = health
