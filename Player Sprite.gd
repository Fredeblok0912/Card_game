extends Sprite2D

func whiteflash():
	$".".material.set_shader_param("solid_color", Color.WHITE)
	await get_tree().create_timer(0.25).timeout
