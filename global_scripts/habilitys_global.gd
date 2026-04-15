extends Node

var _explosion_added_damage: int = 2

var _defense_time_max: float = 0.5
var _defense_timer: float = 0.0

var _vertical_atack_time_max: float = 5.0
var _vertical_atack_timer: float = 0.0

var _explosion_atack_time_max: float = 10.0
var _explosion_atack_timer: float = 0.0

var _defense_max_value: float = 2.5
var _vertical_atack_max_value: float = 3.0
var _explosion_atack_max_value: float = 4.0

var _shield: bool = false
var _vertical_atack = false
var _explosion_atack = false

func ampli_defense_time_max(defense: float):
	_defense_time_max += defense

func get_defense_time_max():
	return _defense_time_max

func add_defense_time(timer: float):
	_defense_timer += timer

func get_defense_time():
	return _defense_timer

func reset_defense_timer():
	_defense_timer = 0.0

func reduce_vertical_atack_time_max(vertical_reduce: float):
	_vertical_atack_time_max -= vertical_reduce

func get_vertical_atack_time_max():
	return _vertical_atack_time_max

func add_vertical_atack_time(timer: float):
	_vertical_atack_timer += timer

func get_vertical_atack_time():
	return _vertical_atack_timer

func reset_vertical_atack_timer():
	_vertical_atack_timer = 0.0

func reduce_explosion_atack_time_max(explosion_reduce: float):
	_explosion_atack_time_max -= explosion_reduce

func get_explosion_atack_time_max():
	return _explosion_atack_time_max

func add_explosion_atack_time(timer: float):
	_explosion_atack_timer += timer

func get_explosion_atack_time():
	return _explosion_atack_timer

func reset_explosion_atack_timer():
	_explosion_atack_timer = 0.0

func get_explosion_added_damage():
	return _explosion_added_damage

func add_explosion_added_damage(new_damage: int):
	_explosion_added_damage += new_damage

func set_damage_player_with_explosion():
	PlayerController.add_damage_player(_explosion_added_damage)

func set_damage_player_without_explosion():
	PlayerController.remove_damage_player(_explosion_added_damage)

func have_shield():
	return _shield

func set_shield(state: bool):
	_shield = state

func have_vertical_atack():
	return _vertical_atack

func set_vertical_atack(state: bool):
	_vertical_atack = state

func have_explosion_atack():
	return _explosion_atack

func set_explosion_atack(state: bool):
	_explosion_atack = state

func have_defense_reach_max():
	if _defense_time_max >= _defense_max_value:
		return true
	else:
		return false

func have_vertical_atack_reach_max():
	if _vertical_atack_time_max >= _vertical_atack_max_value:
		return true
	else:
		return false

func have_explosion_reach_max():
	if _explosion_atack_time_max >= _explosion_atack_max_value:
		return true
	else:
		return false
