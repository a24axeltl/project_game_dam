extends Control

@export var containerButton: VBoxContainer

func _ready() -> void:
	RunScript.stop_timer()
	for button: Button in containerButton.get_children():
		button.pressed.connect(SoundController.play_sound_button)
	RunScript.save_run_data(false)
