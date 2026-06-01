extends CharacterBody2D

enum State {PATROL, CHASE, HIT}

@export var animacion: AnimatedSprite2D
@export var hitbox: Area2D
@export var rayCastFloor: RayCast2D
@export var rayCastWall: RayCast2D

const particles_damage = preload("res://scenes/characters/particles/particles_damage.tscn")
const damage: int = 1
const knockback_force_X := 100.0
const knockback_friction := 10.0
const detection_distance_x: float = 450.0
const detection_distance_y: float = 250.0
const walk_velocity: float = 100.0
const position_x: float = 12.0
const position_y: float = 14.0

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
	
	# Handle "death".
	if _muerto:
		_desactive_collisions()
		RunScript.add_defeated_enemy()
		_disappear_enemy()
		await get_tree().create_timer(0.3).timeout
		queue_free()
		if enemy_container != null:
			enemy_container.defeated_enemy()
	
	# Handle life.
	if _life_count <= 0:
		_muerto = true
	
	# Handle gravity.
	if !is_on_floor():
		velocity += get_gravity() * delta

	# Handle RayCast.
	if !rayCastFloor.is_colliding() or rayCastWall.is_colliding():
		_direction *= -1
		rayCastWall.target_position.x *= -1
		rayCastFloor.target_position.x *= -1
	
	# Handle hit.
	if _state == State.HIT:
		velocity.x = move_toward(velocity.x, 0, knockback_friction)
		velocity.y += get_gravity().y * delta
		move_and_slide()
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

func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.get_owner().is_in_group("enemy"):
		if area.name == "Hitbox":
			_damage_control(area, 1)
	if area.get_owner().is_in_group("player"):
		if area.name == "Hurtbox":
			_damage_control(area, PlayerController.get_damage_player())

func _enter_hit_state():
	animacion.position.x = -position_x
	animacion.play("hit")
	await get_tree().create_timer(0.3).timeout
	_state = State.PATROL

func _damage_control(area: Area2D, damage_value: int):
	_init_particles()
	_life_count -= damage_value
	
	var strike_direction = sign(global_position.x - area.get_parent().get_parent().global_position.x)
	
	velocity.x = strike_direction * 600.0
	_knockback.x = strike_direction * knockback_force_X
	
	_state = State.HIT
	_enter_hit_state()
	_hit = true

	SoundController.play_sound_atack()
	print("El enemigo recibió daño:", _life_count)

func _init_particles():
	var particles = particles_damage.instantiate() as GPUParticles2D
	particles.position.x = 16.0
	particles.position.y = 1.0
	add_child(particles)
	
	particles.restart()
	particles.emitting = true 
	particles.restart()

func _desactive_collisions():
	hitbox.set_deferred("monitoring", false)
	$CollisionShape2D.set_deferred("disabled", true)

func _disappear_enemy():
	animacion.modulate.a = 1.5
	
	var tween: Tween = create_tween()
	tween.tween_property(animacion, "modulate:a", 0.0, 0.5)

func _patrol():
	animacion.position.x = position_x
	velocity.x = _direction * walk_velocity
	animacion.flip_h = velocity.x < 0

func _chase():
	var player_direction = sign(_player.global_position.x - global_position.x)
	velocity.x = player_direction * (walk_velocity*2)
	animacion.flip_h = player_direction < 0
