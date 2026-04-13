extends Button

const time: float = 0.5

func _ready() -> void:
	pressed.connect(_button_pressed)

func _button_pressed():
	HabilitysController.reduce_vertical_atack_time_max(time)
	owner.get_parent().next_level()
	owner.queue_free()
