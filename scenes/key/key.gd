extends Node2D

@export var area: Area2D

var key_container: KeyContainer

func _ready() -> void:
	area.body_entered.connect(_collected)

func _collected(_body: Node2D):
	queue_free()
	key_container.collecte_key()
