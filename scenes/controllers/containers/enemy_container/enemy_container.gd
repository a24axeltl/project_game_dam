class_name EnemyContainer
extends Node

@export var results: PackedScene
@export var transciction: Control

var _total_enemys: int
var _defeated_enemys: int

func _ready() -> void:
	var enemys := get_children()
	_total_enemys = enemys.size()
	for enemy in enemys:
		if enemy.is_in_group("enemy"):
			enemy.enemy_container = self

func defeated_enemy():
	_defeated_enemys += 1
	if _defeated_enemys == _total_enemys and !get_child(1).is_in_group("boss"):
		owner.get_parent().init_menu_modificators()
	elif get_child(1).is_in_group("boss"):
		transciction.to_dark_white_not_load()
		await get_tree().create_timer(13.0).timeout
		get_tree().change_scene_to_packed(results)
