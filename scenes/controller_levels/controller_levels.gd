extends Node2D

@export var levels: Array[PackedScene]
@export var menu_modificators: Control

var _instance_level: Node
var _actual_level: int = 1

func _ready() -> void:
	hide_menu_modificators()
	RunScript.start_timer()
	create_level(_actual_level)

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("debug_next") and _actual_level != levels.size():
		next_level()

func pause():
	get_tree().paused = true

func unpause():
	get_tree().paused = false

func create_level(number_level: int):
	_instance_level = levels[number_level - 1].instantiate()
	add_child(_instance_level)

func delete_level():
	_instance_level.queue_free()

func next_level():
	unpause()
	_actual_level += 1
	delete_level()
	create_level.call_deferred(_actual_level)

func init_menu_modificators():
	menu_modificators.show()
	pause()

func hide_menu_modificators():
	menu_modificators.hide()
