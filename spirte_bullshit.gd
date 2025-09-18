extends Node2D

@onready var animated_sprite = $AnimatedSprite2D

func _ready() -> void:
	IdleAnimation()

func SwingAnimation():
	animated_sprite.play("Swordswing")
	await animated_sprite.animation_finished
	animated_sprite.play("Idle")

func BlockAnimation():
	animated_sprite.play("Swordblock")
	await SpriteControl.animated_sprite.animation_finished
	animated_sprite.play("Idle")
	
	
func IdleAnimation():
	animated_sprite.play("Idle")
