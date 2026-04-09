extends Node2D

@export var hitbox: Area2D
@export var sprite: AnimatedSprite2D

const heal: int = 1

func _ready() -> void:
	hitbox.area_entered.connect(_on_hitbox_player_enetered)

func _on_hitbox_player_enetered(_area: Area2D):
	PlayerController.add_life(heal)
