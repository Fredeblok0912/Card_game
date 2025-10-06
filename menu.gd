extends Node2D
@onready var settings = $Settings
var in_menu: bool = false
var mode = 0

func _ready():
	settings.visible = false

func _on_button_pressed():
	if not in_menu:
		SpriteControl.ButtonclickSFX()
		ScreenTransition.load_scene("res://game.tscn")
		Gamecode.gamestart()

func _on_button_2_pressed():
	if not in_menu:
		SpriteControl.ButtonclickSFX()
		get_tree().quit()


func _on_button_3_pressed():
	SpriteControl.ButtonclickSFX()
	ScreenTransition.load_scene("res://shop.tscn")


func _on_button_5_pressed():
		get_tree().change_scene_to_file("res://settings.tscn")


func _on_button_4_pressed():
	settings.visible = true 
	in_menu = true


func _on_button_exit_pressed():
	settings.visible = false
	in_menu = false


func _on_h_slider_value_changed(value: float):
	var bus_index = AudioServer.get_bus_index("Master")
	if value == -40:
		AudioServer.set_bus_volume_db(bus_index, 0)
	AudioServer.set_bus_volume_db(bus_index, value)
	


func _on_button_mode_pressed():
	mode += 1
	if mode % 1 == 0:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
	
