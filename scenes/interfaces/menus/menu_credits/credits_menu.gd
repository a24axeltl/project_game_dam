extends Control

@export var  transcitionScene: Control

func _ready() -> void:
	SoundController.play_register_theme()
	_transicition_menu()

func _transicition_menu():
	transcitionScene.show()
	transcitionScene.to_light_not_load()
	await transcitionScene.transcition
	transcitionScene.hide()
