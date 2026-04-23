extends Button

const life: int = 1
signal selected

func _ready() -> void:
	pressed.connect(_button_pressed)

func _button_pressed():
	PlayerController.add_life_max(life)
	RunScript.add_num_life_upgrade()
	selected.emit()
