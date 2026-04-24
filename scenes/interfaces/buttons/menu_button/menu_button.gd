extends Button

@export var transcitionScene: Control

func _ready() -> void:
	pressed.connect(_press_button)

func _press_button():
	SoundController.play_sound_button()
	
	var loadScene: PackedScene = load("res://scenes/interfaces/menus/menu_main/main_menu.tscn")
	transcitionScene.show()
	transcitionScene.to_dark(loadScene)
