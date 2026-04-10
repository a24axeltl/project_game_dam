extends Button

const life: int = 1

func _ready() -> void:
	pressed.connect(_button_pressed)

func _button_pressed():
	print("Vida Máxima Aumentada")
	PlayerController.add_life_max(life)
	owner.get_parent().unpause()
	owner.get_parent().next_level()
	owner.queue_free()
