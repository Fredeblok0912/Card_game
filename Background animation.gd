extends AnimatedSprite2D

@export var fps: float = 0.5  # frames per second

func _ready() -> void:
	play("default")
	get_sprite_frames().set_animation_speed("default", fps)
