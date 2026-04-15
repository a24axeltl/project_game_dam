extends Control

@export var label: Label

func _ready() -> void:
	_text_control()

func _text_control():
	label.show()
	label.text = str(_get_text())
	await get_tree().create_timer(5.0).timeout
	queue_free()

func _get_text():
	if owner.is_in_group("meta"):
		return "!Recolecta las llaves para avanzar¡"
	elif owner.is_in_group("recorrido"):
		return "!Recorre el nivel y llega a la meta¡"
	elif owner.is_in_group("combate"):
		return "!Derrota a todos los enemigos¡"
	elif owner.is_in_group("boss"):
		return "!Derrota al jefe¡"
	else:
		"Default Message: Completa el nivel"
