extends Control

@export var containerButton: VBoxContainer

func _ready() -> void:
	SoundController.stop_music()
	for button: Button in containerButton.get_children():
		button.pressed.connect(SoundController.play_sound_button)
