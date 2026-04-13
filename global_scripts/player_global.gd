extends Node

signal current_life

var _life_max_count: int = 4
var _life_current_count: int = _life_max_count

var _damage: int = 1
var _explosion_added_damage: int = 2

var _jump_count_max: int = 1
var _jump_count_current: int = 0

var _dash_count_max: int = 1
var _dash_count_current: int = 0

var _defense_time_max: float = 0.5
var _defense_timer: float = 0.0

var _inmunity_time_max: float = 0.5
var _inmunity_timer: float = 0.0

var _dash_time_max: float = 1.5
var _dash_timer: float = 0.0

var _vertical_atack_time_max: float = 5.0
var _vertical_atack_timer: float = 0.0

var _explosion_atack_time_max: float = 10.0
var _explosion_atack_timer: float = 0.0

var _shield: bool = false
var _vertical_atack = false
var _explosion_atack = false
var _muerto: bool = false

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

func set_inmunity_time_max(inmunity_max: float):
	_inmunity_time_max = inmunity_max

func get_inmunity_time_max():
	return _inmunity_time_max

func add_inmunity_time(timer: float):
	_inmunity_timer += timer

func get_inmunity_time():
	return _inmunity_timer

func reset_inmunity_timer():
	_inmunity_timer = 0.0

func reduce_dash_time_max(dash_reduce: float):
	_dash_time_max -= dash_reduce

func get_dash_time_max():
	return _dash_time_max

func add_dash_time(timer: float):
	_dash_timer += timer

func get_dash_time():
	return _dash_timer

func reset_dash_timer():
	_dash_timer = 0.0

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

func get_life_count():
	return _life_current_count

func subtract_life(damage: int):
	_life_current_count -= damage
	if _life_current_count <= 0:
		_muerto = true
	current_life.emit()

func add_life(life: int):
	_life_current_count += life
	if _life_current_count >= _life_max_count:
		_life_current_count = _life_max_count
	current_life.emit()

func get_life_max():
	return _life_max_count

func add_life_max(life: int):
	_life_max_count += life
	_life_current_count = _life_max_count
	current_life.emit()

func get_jump_count():
	return _jump_count_current

func get_damage_player():
	return _damage

func add_damage_player(new_damage: int):
	_damage += new_damage

func get_explosion_added_damage():
	return _explosion_added_damage

func add_explosion_added_damage(new_damage: int):
	_explosion_added_damage += new_damage

func set_damage_player_with_explosion():
	_damage += _explosion_added_damage

func set_damage_player_without_explosion():
	_damage -= _explosion_added_damage

func add_jump_count(jump: int):
	_jump_count_current += jump

func reset_jump_count():
	_jump_count_current = 0

func get_jump_max():
	return _jump_count_max

func set_jump_max(jump: int):
	_jump_count_max = jump

func get_dash_count():
	return _dash_count_current

func add_dash_count(dash: int):
	_dash_count_current += dash

func reset_dash_count():
	_dash_count_current = 0

func get_dash_max():
	return _dash_count_max

func set_dash_max(jump: int):
	_dash_count_max = jump

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

func is_muerto():
	return _muerto

func set_muerto(state: bool):
	_muerto = state
