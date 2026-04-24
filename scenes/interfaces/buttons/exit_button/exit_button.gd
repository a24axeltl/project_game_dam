extends Button

@export var transcitionScene: Control

func _ready() -> void:
	pressed.connect(_press_button)

func _press_button():
	transcitionScene.show()
	transcitionScene.to_dark_not_load()
	await transcitionScene.transcition
	get_tree().quit(0)
