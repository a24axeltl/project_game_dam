extends Button

@export var transcitionScene: Control

func _ready() -> void:
	pressed.connect(_press_button)

func _press_button():
	PlayerController.load_script()
	HabilitysController.load_script()
	RunScript.load_script()
	
	var loadScene: PackedScene = load("res://scenes/interfaces/load_scene/load_scene.tscn")
	transcitionScene.show()
	transcitionScene.to_dark(loadScene)
