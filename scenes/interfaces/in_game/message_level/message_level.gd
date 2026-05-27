extends Control

@export var label: Label

signal finish

func _ready() -> void:
	_text_control()

func _text_control():
	label.text = str(_get_text())
	label.modulate.a = 0.0
	show_message()

func _get_text():
	if owner.owner.is_in_group("meta"):
		return "!Recolecta las llaves para avanzar¡"
	elif owner.owner.is_in_group("recorrido"):
		return "!Recorre el nivel y llega a la meta¡"
	elif owner.owner.is_in_group("combate"):
		return "!Derrota a todos los enemigos¡"
	elif owner.owner.is_in_group("boss"):
		return "!Derrota al jefe¡"
	else:
		return "Completa el nivel"

func show_message() -> void:
	var tween: Tween = create_tween()
	tween.tween_interval(0.5) 
	tween.tween_property(label, "modulate:a", 1.5, 1.5)
	tween.tween_interval(1.5)
	tween.tween_property(label, "modulate:a", 0.0, 1.5)
	tween.finished.connect(finish_signal)

func finish_signal():
	finish.emit()
