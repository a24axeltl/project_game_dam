extends Button

@export var transcitionScene: Control

func _ready() -> void:
	pressed.connect(_press_button)

func _press_button():
	var register_scene = load("res://scenes/interfaces/menus/menu_register/menu_register.tscn")
	transcitionScene.show()
	transcitionScene.to_dark(register_scene)
