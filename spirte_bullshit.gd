extends Node2D

var Enemy_sprites = ["Slime","Zombie"]

@onready var animated_sprite = $AnimatedSprite2D
@onready var ShieldUp = $ShieldUp
@onready var SwordSwing = $SwordSwing
@onready var BackgroundMusic = $Music
@onready var Enemy_sprite = $Enemy_sprites
@onready var EnemyDie = $EnemyDie
@onready var ButtonClick = $ButtonClick
@onready var ShopBuy = $ShopBuy
@onready var Heal = $ShopIncreaseHp
@onready var IncreaseMaxHP = $ShopHeal
@onready var CantDoAction = $CantDoAction
@onready var CardPlayed = $CardPlayed
@onready var PlayerHit = $PlayerHit

func _ready() -> void:
	IdleAnimation()
	BackgroundMusic.play()

func SwingAnimation():
	animated_sprite.play("Swordswing")
	SwordSwing.play()
	await animated_sprite.animation_finished
	animated_sprite.play("Idle")

func BlockAnimation():
	animated_sprite.play("Swordblock")
	ShieldUpSFX()
	await SpriteControl.animated_sprite.animation_finished
	animated_sprite.play("Idle")
	
func HealAnimation():
	animated_sprite.play("PotionDrink")
	HealSFX()
	await SpriteControl.animated_sprite.animation_finished
	animated_sprite.play("Idle")
	
func IdleAnimation():
	animated_sprite.play("Idle")

func set_sprite(chosen):
	print(chosen)
	Enemy_sprite.play(chosen)
	
func EnemyDieSFX():
	EnemyDie.play()
	
func ButtonclickSFX():
	ButtonClick.play()
	
func ShopBuySFX():
	ShopBuy.play()

func IncreaseMaxHPSFX():
	IncreaseMaxHP.play()

func HealSFX():
	Heal.play()
	
func ShieldUpSFX():
	ShieldUp.play()

func CantDoActionSFX():
	CantDoAction.play()

func CardPlayedSFX():
	CardPlayed.play()
	
func PlayerHitSFX():
	PlayerHit.play()
	
func PlayerTookDamage():
	animated_sprite.play("PlayerHit")
	PlayerHit.play()
	await SpriteControl.animated_sprite.animation_finished
	animated_sprite.play("Idle")
