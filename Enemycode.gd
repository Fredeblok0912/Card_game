extends Character
class_name Enemy

func _turn():
	pass
	
func _attack(value):
	var player = $Player
	player.set_health(player. - value)
	
func _choose():
	pass
