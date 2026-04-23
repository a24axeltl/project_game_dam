extends Button

const time: float = 1.5
signal selected

func _ready() -> void:
	pressed.connect(_button_pressed)

func _button_pressed():
	HabilitysController.reduce_explosion_atack_time_max(time)
	RunScript.add_num_time_explosion_upgrade()
	selected.emit()
