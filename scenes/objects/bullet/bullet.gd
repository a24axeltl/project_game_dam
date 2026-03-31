extends CharacterBody2D

@export var hitbox: Area2D

const damage: int = 1

var direction: float = 0.0
var velocity_bullet: float = 1000

func _ready() -> void:
	hitbox.area_entered.connect(_on_hitbox_area_entered)
	hitbox.body_entered.connect(_on_hitbox_body_entered)
	rotation = direction

func _physics_process(_delta: float) -> void:
	velocity = Vector2(velocity_bullet,0).rotated(direction)
	move_and_slide()

func _on_hitbox_area_entered(_area: Area2D):
	queue_free()

func _on_hitbox_body_entered(_body: Node2D):
	queue_free()
