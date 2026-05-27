extends Button

@export var transcitionScene: Control

func _ready() -> void:
	pressed.connect(_press_button)
	mouse_entered.connect(_hover_button)

func _hover_button():
	SoundController.play_sound_hover()

func _press_button():
	transcitionScene.show()
	transcitionScene.to_dark_not_load()
	await transcitionScene.transcition
	get_tree().quit(0)
