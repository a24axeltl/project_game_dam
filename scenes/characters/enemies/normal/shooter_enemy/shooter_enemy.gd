extends Node2D

@export var spawnPoint: Node2D
@export var timer: Timer

const damage: int = 1

var bullet = preload("res://scenes/objects/damage_objects/bullet/bullet.tscn")

func _ready() -> void:
	timer.timeout.connect(shoot)

func shoot():
	var newBullet = bullet.instantiate()
	newBullet.direction = PI / 2
	newBullet.global_position = spawnPoint.global_position
	get_parent().add_child(newBullet)
