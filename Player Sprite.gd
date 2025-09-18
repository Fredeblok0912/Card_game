extends AnimatedSprite2D

# Play Idle animation and wait for finish
func play_idle() -> void:
	play("Idle")

# Play Swordblock animation and wait for finish
func play_swordblock() -> void:
	play("Swordblock")
	await $PlayerSprite.play_Swordblock()
	play("Idle")

func play_swordswing() -> void:
	var sprite = get_node("PlayerSprite")
	sprite.play("Swordswing")
	await sprite.animation_finished
	sprite.play("Idle")
