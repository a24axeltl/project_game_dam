class_name EnemyContainer
extends Node

var _total_enemys: int
var _defeated_enemys: int

func _ready() -> void:
	var enemys := get_children()
	_total_enemys = enemys.size()
	for enemy in enemys:
		enemy.enemy_container = self

func defeated_enemy():
	_defeated_enemys += 1
	if _defeated_enemys == _total_enemys and !get_child(0).is_in_group("boss"):
		owner.get_parent().init_menu_modificators()
	elif get_child(0).is_in_group("boss"):
		owner.get_parent().next_level()
