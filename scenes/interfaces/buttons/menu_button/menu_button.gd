extends Button

func _ready() -> void:
	pressed.connect(_press_button)

func _press_button():
	SoundController.play_sound_button()
	get_tree().change_scene_to_file("res://scenes/interfaces/menus/menu_main/main_menu.tscn")
