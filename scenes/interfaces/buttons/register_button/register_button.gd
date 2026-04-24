extends Button

func _ready() -> void:
	pressed.connect(_press_button)

func _press_button():
	get_tree().change_scene_to_file("res://scenes/interfaces/menus/menu_register/menu_register.tscn")
