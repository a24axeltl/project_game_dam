extends Node2D

@export var area: Area2D

func _ready() -> void:
	area.body_entered.connect(_enter_door)

func _enter_door(_body: Node2D):
	owner.get_parent().init_menu_modificators()
