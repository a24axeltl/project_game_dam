extends Button

func _ready() -> void:
	pressed.connect(_press_button)

func _press_button():
	PlayerController.load_script()
	HabilitysController.load_script()
	RunScript.load_script()
	
	var controllerLevels = load("res://scenes/controller_levels/controller_levels.tscn")
	get_tree().change_scene_to_packed(controllerLevels)
