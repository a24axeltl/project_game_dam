extends CharacterBody2D

enum State {PATROL, HIT}

@export var hitbox: Area2D
@export var rayCastDown: RayCast2D
@export var rayCastRight: RayCast2D
@export var rayCastUp: RayCast2D
@export var rayCastLeft: RayCast2D

const knockback_force_X := 300.0
const knockback_force_Y := -300.0
const knockback_friction := 10.0
const detection_distance: float = 250.0
const walk_velocity: float = 100.0
const damage: int = 1

var _hit: bool = false
var _muerto: bool = false
var _life_count: int = 8
var _direction: int = 1
var _knockback := Vector2.ZERO
var _state: State = State.PATROL
var enemy_container: EnemyContainer

func _ready() -> void:
	hitbox.area_entered.connect(_on_area_2d_area_entered)

func _physics_process(delta: float) -> void:
	# Handle "death".
	if _muerto:
		RunScript.add_defeated_enemy()
		queue_free()
		if enemy_container != null:
			enemy_container.defeated_enemy()
			return
	
	# Handle RayCast.
	if rayCastDown.is_colliding() or rayCastRight.is_colliding() or rayCastUp.is_colliding() or rayCastLeft.is_colliding():
		_direction *= -1
	
	# Handle hit.
	if _state == State.HIT:
		velocity.x = move_toward(velocity.x, 0, knockback_friction)
		velocity.y += get_gravity().y * delta
		move_and_slide()
		return

	# Handle state.
	match _state:
		State.PATROL:
			_patrol()

	move_and_slide()
	
	# Handle life.
	if _life_count <= 0:
		_muerto = true

func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.get_parent().get_parent().is_in_group("player"):
		if area.name == "Hurtbox":
			_damage_control(area)

func _enter_hit_state():
	await get_tree().create_timer(0.3).timeout
	_state = State.PATROL

func _damage_control(area: Area2D):
	_life_count -= PlayerController.get_damage_player()
	_hit = true
	var strike_direction = sign(global_position.x - area.get_parent().get_parent().global_position.x)
	
	# Aplye knockback.
	velocity.x = strike_direction * 600.0
	velocity.y = -450.0
	_knockback.x = strike_direction * knockback_force_X
	_knockback.y = knockback_force_Y
	
	_state = State.HIT
	_enter_hit_state()
	
	print("El enemigo recibio daño:")
	print(_life_count)

func _patrol():
	velocity.x = _direction * walk_velocity
	velocity.y = _direction * walk_velocity
