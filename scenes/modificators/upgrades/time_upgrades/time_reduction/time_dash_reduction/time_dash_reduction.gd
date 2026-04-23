extends Button

const time: float = 0.5
signal selected

func _ready() -> void:
	pressed.connect(_button_pressed)

func _button_pressed():
	HabilitysController.reduce_dash_time_max(time)
	RunScript.add_num_time_dash_upgrade()
	selected.emit()
