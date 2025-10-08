extends Node2D
@onready var self_node = $Settings

func _ready():
	var bus_index = AudioServer.get_bus_index("Master")
	$Settings/Sprite2D/HSlider.value = AudioServer.get_bus_volume_db(bus_index)

func _on_h_slider_value_changed(value: float):
	var bus_index = AudioServer.get_bus_index("Master")
	AudioServer.set_bus_volume_db(bus_index, value)

func _on_button_pressed():
	self_node.visible = false
	


func _on_button_2_pressed():
	var win_id = get_window().get_window_id()
	var current_mode = DisplayServer.window_get_mode(win_id)
	if current_mode == DisplayServer.WINDOW_MODE_FULLSCREEN:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
