extends Control

@export var transcitionScene: Control

var controllerLevelsPath = "res://scenes/controllers/controller_levels/controller_levels.tscn"

func _ready() -> void:
	transcitionScene.to_light_not_load()
	$AnimatedSprite2D.play("default")
	ResourceLoader.load_threaded_request(controllerLevelsPath)

func _process(_delta: float) -> void:
	var status = ResourceLoader.load_threaded_get_status(controllerLevelsPath)
	
	if status == ResourceLoader.THREAD_LOAD_LOADED:
		var controller = ResourceLoader.load_threaded_get(controllerLevelsPath)
		transcitionScene.to_dark(controller)
