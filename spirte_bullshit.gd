extends Node2D

@onready var animated_sprite = $AnimatedSprite2D
@onready var ShieldUpSFX = $ShieldUp
@onready var SwordSwingSFX = $SwordSwing
@onready var BackgroundMusic = $Music

func _ready() -> void:
	IdleAnimation()
	BackgroundMusic.play()

func SwingAnimation():
	animated_sprite.play("Swordswing")
	SwordSwingSFX.play()
	await animated_sprite.animation_finished
	animated_sprite.play("Idle")

func BlockAnimation():
	animated_sprite.play("Swordblock")
	ShieldUpSFX.play()
	await SpriteControl.animated_sprite.animation_finished
	animated_sprite.play("Idle")
	
func HealAnimation():
	animated_sprite.play("PotionDrink")
	ShieldUpSFX.play()
	await SpriteControl.animated_sprite.animation_finished
	animated_sprite.play("Idle")
	
func IdleAnimation():
	animated_sprite.play("Idle")
