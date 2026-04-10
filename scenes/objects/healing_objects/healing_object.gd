extends Node2D

@export var hitbox: Area2D
@export var sprite: AnimatedSprite2D

const heal: int = 1

var is_pick: bool = false

func _ready() -> void:
	hitbox.area_entered.connect(_on_hitbox_player_enetered)

func _on_hitbox_player_enetered(_area: Area2D):
	if !is_pick:
		print("Se cura!")
		PlayerController.add_life(heal)
		sprite.play("no_fruit")
		is_pick = true
