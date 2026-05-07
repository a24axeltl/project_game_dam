extends Control

var controllerLevelsPath = "res://scenes/controller_levels/controller_levels.tscn"

func _ready() -> void:
	$AnimatedSprite2D.play("default")
	ResourceLoader.load_threaded_request(controllerLevelsPath)

func _process(_delta: float) -> void:
	var status = ResourceLoader.load_threaded_get_status(controllerLevelsPath)
	
	if status == ResourceLoader.THREAD_LOAD_LOADED:
		var controller = ResourceLoader.load_threaded_get(controllerLevelsPath)
		get_tree().change_scene_to_packed(controller)
