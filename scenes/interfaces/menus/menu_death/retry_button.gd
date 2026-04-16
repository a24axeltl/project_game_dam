extends Button

func _ready() -> void:
	pressed.connect(_press_button)

func _press_button():
	PlayerController.load_script()
	HabilitysController.load_script()
	RunScript.load_script()
	
	var loadScene = load("res://scenes/load_scene/load_scene.tscn")
	get_tree().change_scene_to_packed(loadScene)
