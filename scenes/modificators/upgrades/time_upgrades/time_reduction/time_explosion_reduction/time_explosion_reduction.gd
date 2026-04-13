extends Button

const time: float = 1.5

func _ready() -> void:
	pressed.connect(_button_pressed)

func _button_pressed():
	HabilitysController.reduce_explosion_atack_time_max(time)
	owner.get_parent().next_level()
	owner.queue_free()
