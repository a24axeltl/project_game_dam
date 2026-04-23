extends Button

const time: float = 0.5
signal selected

func _ready() -> void:
	pressed.connect(_button_pressed)

func _button_pressed():
	HabilitysController.ampli_defense_time_max(time)
	RunScript.add_num_time_shield_upgrade()
	selected.emit()
