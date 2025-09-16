extends Character
class_name Enemy

func _turn():
	pass
	
func _attack(value):
	var player = $Player
	player.set_health(player. - value)
	
func _choose():
	pass


#moveset slime
# - attack deal 5 damage x difficulty_mod
# - attack deal 8 damage x difficulty_mod
# - shield gain 4 block x difficulty_mod
# - heal/shield regain 3 health and get 2 sheild x difficulty_mod

#moveset zombie
# - attack/heal deal 4 damage and regain 2 health x difficulty_mod
# - attack/shield deal 6 damage and gian 3 shield x difficulty_mod
# - shield gain 4 block x difficulty_mod
# - heal regain 5 health x difficulty_mod
