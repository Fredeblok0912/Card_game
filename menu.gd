extends Node2D

func _ready():
	$CanvasLayer/Button4/SettingsWindow.hide()

func _on_button_pressed():
	SpriteControl.ButtonclickSFX()
	ScreenTransition.load_scene("res://game.tscn")
	Gamecode.gamestart()

func _on_button_2_pressed():
	SpriteControl.ButtonclickSFX()
	get_tree().quit()


func _on_button_3_pressed():
	SpriteControl.ButtonclickSFX()
	ScreenTransition.load_scene("res://shop.tscn")


func _on_settings_pressed():
	$CanvasLayer/Button4/SettingsWindow.popup_centered(Vector2(500,500))
	var bus_index = AudioServer.get_bus_index("Master")
	$CanvasLayer/Button4/SettingsWindow/VBoxContainer/HBoxContainer/HSlider.value = AudioServer.get_bus_volume_db(bus_index)


func _on_h_slider_value_changed(value: float) -> void:
	var bus_index = AudioServer.get_bus_index("Master")
	if value > -40:
		AudioServer.set_bus_volume_db(bus_index, value)
	else:
		AudioServer.set_bus_volume_db(bus_index, -80)


func _on_close_button_pressed():
	$CanvasLayer/Button4/SettingsWindow.hide()




func _on_check_box_toggled(toggled_on: bool) -> void:
	if toggled_on:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
