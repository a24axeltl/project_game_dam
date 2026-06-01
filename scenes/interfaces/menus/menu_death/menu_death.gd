extends Control

@export var containerButton: VBoxContainer

func _ready() -> void:
	SoundController.play_game_over_theme()
	RunScript.stop_timer()
	for button: Button in containerButton.get_children():
		button.pressed.connect(SoundController.play_sound_button)
		button.mouse_entered.connect(SoundController.play_sound_hover)
	RunScript.save_run_data(false)
