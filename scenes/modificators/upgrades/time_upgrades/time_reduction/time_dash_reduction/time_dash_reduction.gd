extends Button

const time: float = 0.5
signal selected

func _ready() -> void:
	pressed.connect(_button_pressed)
	mouse_entered.connect(_hover_button)

func _hover_button():
	SoundController.play_sound_hover()

func _button_pressed():
	SoundController.play_sound_key_pick()
	HabilitysController.reduce_dash_time_max(time)
	RunScript.add_num_time_dash_upgrade()
	selected.emit()
