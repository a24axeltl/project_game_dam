extends Button

const damage: int = 1
signal selected

func _ready() -> void:
	pressed.connect(_button_pressed)
	mouse_entered.connect(_hover_button)

func _hover_button():
	SoundController.play_sound_hover()

func _button_pressed():
	SoundController.play_sound_key_pick()
	PlayerController.add_damage_player(damage)
	RunScript.add_num_damage_upgrade()
	selected.emit()
