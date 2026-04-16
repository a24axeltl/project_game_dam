extends Control

var timer: Timer
var _time_in_seconds: int
var _num_hits: int

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
