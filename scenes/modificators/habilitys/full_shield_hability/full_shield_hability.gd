extends Button

signal selected

func _ready() -> void:
	pressed.connect(_button_pressed)
	mouse_entered.connect(_hover_button)

func _hover_button():
	SoundController.play_sound_hover()

func _button_pressed():
	SoundController.play_sound_key_pick()
	HabilitysController.set_shield(true)
	RunScript.add_num_hability()
	selected.emit()
