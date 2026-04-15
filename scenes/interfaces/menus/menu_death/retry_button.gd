extends Button

@export var controller_levels: PackedScene

func _ready() -> void:
	pressed.connect(_press_button)

func _press_button():
	print("Pendiente")
