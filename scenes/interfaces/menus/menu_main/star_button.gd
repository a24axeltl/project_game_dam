extends Button

@export var loadScene: PackedScene

func _ready() -> void:
	pressed.connect(_press_button)

func _press_button():
	get_tree().change_scene_to_packed(loadScene)
