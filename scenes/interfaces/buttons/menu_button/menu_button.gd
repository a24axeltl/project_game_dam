extends Button

@export var transcitionScene: Control

func _ready() -> void:
	pressed.connect(_press_button)
	mouse_entered.connect(_hover_button)

func _hover_button():
	SoundController.play_sound_hover()

func _press_button():
	SoundController.play_sound_button()
	SoundController.stop_music()
	var loadScene: PackedScene = load("res://scenes/interfaces/menus/menu_main/main_menu.tscn")
	transcitionScene.show()
	transcitionScene.to_dark(loadScene)
