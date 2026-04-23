extends Button

const damage: int = 1
signal selected

func _ready() -> void:
	pressed.connect(_button_pressed)

func _button_pressed():
	PlayerController.add_damage_player(damage)
	RunScript.add_num_damage_upgrade()
	selected.emit()
