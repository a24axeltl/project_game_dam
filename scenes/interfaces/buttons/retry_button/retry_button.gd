extends Button

@export var transcitionScene: Control

func _ready() -> void:
	pressed.connect(_press_button)
	mouse_entered.connect(_hover_button)

func _hover_button():
	SoundController.play_sound_hover()

func _press_button():
	SoundController.play_sound_button()
	PlayerController.load_script()
	HabilitysController.load_script()
	RunScript.load_script()
	
	SoundController.stop_music()
	var loadScene: PackedScene = load("res://scenes/interfaces/transicitions/load_scene/load_scene.tscn")
	transcitionScene.show()
	transcitionScene.to_dark(loadScene)
