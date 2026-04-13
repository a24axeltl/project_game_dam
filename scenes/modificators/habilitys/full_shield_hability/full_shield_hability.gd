extends Button

func _ready() -> void:
	pressed.connect(_button_pressed)

func _button_pressed():
	HabilitysController.set_shield(true)
	owner.get_parent().next_level()
	owner.queue_free()
