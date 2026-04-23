extends Control

var timer: Timer
var _time_in_seconds: int
var _num_hits: int
var _num_defeated_enemys: int
var _num_habilitys: int
var _num_damage_upgrades: int
var _num_life_upgrades: int
var _num_time_shield_upgrades: int
var _num_time_dash_upgrades: int
var _num_time_explosion_upgrades: int
var _num_time_vertical_atack_upgrades: int


func _ready() -> void:
	timer = Timer.new()
	add_child(timer)
	timer.wait_time = 1.0
	timer.timeout.connect(_on_timer_timeout)
	load_script()

func load_script():
	_time_in_seconds = 0
	_num_hits = 0
	if timer:
		timer.stop()

func _on_timer_timeout():
	_time_in_seconds += 1

func start_timer():
	_time_in_seconds = 0
	timer.start()

func stop_timer():
	timer.stop()

func get_time():
	var m = int(_time_in_seconds / 60.0)
	var s = _time_in_seconds - m * 60
	return '%02d:%02d' % [m,s]

func add_hit():
	_num_hits += 1

func get_hits():
	return _num_hits
	
func add_defeated_enemy():
	_num_defeated_enemys += 1

func get_defeated_enemys():
	return _num_defeated_enemys

func add_num_hability():
	_num_habilitys += 1

func get_num_habilitys():
	return _num_habilitys

func add_num_damage_upgrade():
	_num_damage_upgrades += 1

func get_num_damage_upgrades():
	return _num_damage_upgrades

func add_num_life_upgrade():
	_num_life_upgrades += 1

func get_num_life_upgrades():
	return _num_life_upgrades

func add_num_time_shield_upgrade():
	_num_time_shield_upgrades += 1

func get_num_time_shield_upgrades():
	return _num_time_shield_upgrades

func add_num_time_dash_upgrade():
	_num_time_dash_upgrades += 1

func get_num_time_dash_upgrades():
	return _num_time_dash_upgrades

func add_num_time_explosion_upgrade():
	_num_time_explosion_upgrades += 1

func get_num_time_explosion_upgrades():
	return _num_time_explosion_upgrades

func add_num_time_vertical_atack_upgrade():
	_num_time_vertical_atack_upgrades += 1

func get_num_time_vertical_atack_upgrades():
	return _num_time_vertical_atack_upgrades

func get_text_habilitys():
	return str(_num_habilitys,"/",HabilitysController.get_number_max_habilitys())

func get_text_damage_upgrades():
	return str(_num_damage_upgrades,"/",HabilitysController.get_number_max_upgrades())

func get_text_life_upgrades():
	return str(_num_life_upgrades,"/",HabilitysController.get_number_max_upgrades())

func get_text_time_shield_upgrades():
	return str(_num_time_shield_upgrades,"/",HabilitysController.get_number_max_upgrades())

func get_text_time_dash_upgrades():
	return str(_num_time_dash_upgrades,"/",HabilitysController.get_number_max_upgrades())

func get_text_time_explosion_upgrades():
	return str(_num_time_explosion_upgrades,"/",HabilitysController.get_number_max_upgrades())

func get_text_time_vertical_atack_upgrades():
	return str(_num_time_vertical_atack_upgrades,"/",HabilitysController.get_number_max_upgrades())
