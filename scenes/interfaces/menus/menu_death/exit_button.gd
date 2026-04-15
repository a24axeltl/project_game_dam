extends Button

func _ready() -> void:
	pressed.connect(_press_button)

func _press_button():
	get_tree().quit(0)
