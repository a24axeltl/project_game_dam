extends Control

var timer: Timer = Timer.new()
var _time_in_seconds: int = 0
var _num_hits: int = 0

func _ready() -> void:
	add_child(timer)
	timer.wait_time = 1.0
	timer.timeout.connect(_on_timer_timeout)

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
