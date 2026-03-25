extends Node2D

@export var levels: Array[PackedScene]

var _instance_level: Node
var _actual_level: int = 1

func _ready() -> void:
	RunScript.start_timer()
	create_level(_actual_level)

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("debug_next") and _actual_level != levels.size():
		next_level()

func create_level(number_level: int):
	_instance_level = levels[number_level - 1].instantiate()
	add_child(_instance_level)

func delete_level():
	_instance_level.queue_free()

func next_level():
	_actual_level += 1
	delete_level()
	create_level.call_deferred(_actual_level)
