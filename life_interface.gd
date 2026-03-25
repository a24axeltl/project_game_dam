extends Control

@export var label: Label

func _ready() -> void:
	PlayerController.current_life.connect(_update_text)

func _update_text():
	label.show()
	label.text = str(PlayerController.get_life_count())
	await get_tree().create_timer(1.0).timeout
	if PlayerController.get_life_count() == PlayerController.get_life_max():
		label.hide()
