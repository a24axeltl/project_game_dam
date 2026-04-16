extends Node

signal current_life

var _life_max_count: int
var _life_current_count: int

var _damage: int

var _jump_count_max: int
var _jump_count_current: int

var _dash_count_max: int
var _dash_count_current: int

var _dash_time_max: float
var _dash_timer: float

var _inmunity_time_max: float
var _inmunity_timer: float

var _dash_max_value: float
var _life_max_value: int
var _damage_max_value: int

var _muerto: bool

func _ready() -> void:
	load_script()

func load_script():
	_life_max_count = 4
	_life_current_count = _life_max_count

	_damage = 1

	_jump_count_max = 1
	_jump_count_current = 0

	_dash_count_max = 1
	_dash_count_current = 0

	_dash_time_max = 2.5
	_dash_timer = 0.0

	_inmunity_time_max = 0.5
	_inmunity_timer = 0.0

	_dash_max_value = 0.5
	_life_max_value = 8
	_damage_max_value = 4

	_muerto = false

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

func remove_damage_player(new_damage: int):
	_damage -= new_damage

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

func is_muerto():
	return _muerto

func set_muerto(state: bool):
	_muerto = state

func have_dash_reach_max():
	if _dash_time_max >= _dash_max_value:
		return true
	else:
		return false

func have_life_reach_max():
	if _life_max_count >= _life_max_value:
		return true
	else:
		return false

func have_damage_reach_max():
	if _damage >= _damage_max_value:
		return true
	else:
		return false
