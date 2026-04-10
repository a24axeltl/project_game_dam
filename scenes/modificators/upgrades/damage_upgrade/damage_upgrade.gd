extends Button

const damage: int = 1

func _ready() -> void:
	pressed.connect(_button_pressed)

func _button_pressed():
	PlayerController.add_damage_player(damage)
	owner.get_parent().next_level()
	owner.queue_free()
