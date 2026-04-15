extends Button

signal selected

func _ready() -> void:
	pressed.connect(_button_pressed)

func _button_pressed():
	HabilitysController.set_vertical_atack(true)
	selected.emit()
