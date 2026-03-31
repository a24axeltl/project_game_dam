extends CharacterBody2D

enum State {PATROL, CHASE}

@export var animacion: AnimatedSprite2D
@export var hitbox: Area2D
@export var rayCastFloor: RayCast2D
@export var rayCastWall: RayCast2D

const damage: int = 1
const knockback_force_X := 400.0
const knockback_force_Y := -400.0
const detection_distance_x: float = 450.0
const detection_distance_y: float = 250.0
const walk_velocity: float = 100.0

var _hit: bool = false
var _muerto: bool = false
var _life_count: int = 2
var _direction: int = 1
var _knockback := Vector2.ZERO
var _state: State = State.PATROL
var _player: Node2D
var enemy_container: EnemyContainer

func _ready() -> void:
	hitbox.area_entered.connect(_on_area_2d_area_entered)

func _physics_process(delta: float) -> void:
	_player = get_tree().get_first_node_in_group("player")
	
	# Handle gravity.
	if !is_on_floor():
		velocity += get_gravity() * delta

	# Handle RayCast.
	if !rayCastFloor.is_colliding() or rayCastWall.is_colliding():
		_direction *= -1
		rayCastWall.target_position.x *= -1
		rayCastFloor.target_position.x *= -1

	# Handle "death".
	if _muerto:
		queue_free()
		if enemy_container != null:
			enemy_container.defeated_enemy()
	
	# Handle hit.
	if _hit:
		velocity = _knockback
		_hit = false
		await get_tree().create_timer(0.5).timeout
		velocity = Vector2.ZERO
		return
	
	# Handle detection.
	if _player:
		var distance = _player.global_position - global_position
		if abs(distance.x) < detection_distance_x and abs(distance.y) < detection_distance_y:
			_state = State.CHASE
		else:
			_state = State.PATROL
	
	# Handle state.
	match _state:
		State.PATROL:
			_patrol()
		State.CHASE:
			_chase()

	move_and_slide()
	animacion.play("idle")
	
	# Handle life.
	if _life_count == 0:
		_muerto = true

func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.get_owner().is_in_group("player"):
		if area.name == "Hurtbox":
			_damage_control(area)

func _damage_control(area: Area2D):
	_life_count -= PlayerController.get_damage_player()
	_hit = true
	var strike_direction = sign(global_position.x - area.get_parent().get_parent().global_position.x)
	
	# Aplye knockback.
	_knockback.x = strike_direction * knockback_force_X
	_knockback.y = knockback_force_Y
	
	print("El enemigo recibio daño:")
	print(_life_count)

func _patrol():
	velocity.x = _direction * walk_velocity
	animacion.flip_h = velocity.x < 0

func _chase():
	var player_direction = sign(_player.global_position.x - global_position.x)
	velocity.x = player_direction * (walk_velocity*2)
	animacion.flip_h = player_direction < 0
