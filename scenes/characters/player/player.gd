extends CharacterBody2D

@export var blue_shader: ShaderMaterial
@export var animacion: AnimatedSprite2D
@export var hurtboxPivot: Node2D
@export var hitbox: Area2D
@export var hurtbox: Area2D

const walk_velocity: float = 300.0
const jump_velocity: float = -500.0
const knockback_force_X := 400.0
const knockback_force_Y := -400.0
const hurtbox_offset = Vector2(38, 38)

var _hit: bool = false
var _atacking: bool = false
var _defending: bool = false
var _inmunity: bool = false
var _dashing: bool = false
var _knockback := Vector2.ZERO
var _hurtbox_pos = Vector2.ZERO

func _ready() -> void:
	hurtbox.area_entered.connect(_on_hurtbox_hitbox_entered)

func _physics_process(delta: float) -> void:
	#Handle inmunity
	if PlayerController.get_inmunity_time() < PlayerController.get_inmunity_time_max() and _inmunity:
		PlayerController.add_inmunity_time(delta)
	else:
		_inmunity = false
		PlayerController.reset_inmunity_timer()
	
	# Handle damage with a hitbox.
	_handle_damage_hitbox()
	
	if PlayerController.is_muerto():
		get_tree().quit(0)

	if !is_on_floor():
		velocity += get_gravity() * delta
	else:
		PlayerController.reset_jump_count()
		PlayerController.reset_dash_count()

	if !_atacking:
		hurtbox.monitoring  = false
		hurtbox.monitorable = false

	# Handle jump.
	if Input.is_action_just_pressed("salto") and PlayerController.get_jump_count() <= 1:
		velocity.y = jump_velocity
		PlayerController.add_jump_count(1)

	# Handle movemnt.
	if Input.is_action_pressed("der"):
		velocity.x = walk_velocity
		animacion.flip_h = false
	elif Input.is_action_pressed("izq"):
		velocity.x = -walk_velocity
		animacion.flip_h = true
	else:
		velocity.x = 0

	# Handle hurtbox.
	if Input.is_action_pressed("der"):
		_hurtbox_pos.x = hurtbox_offset.x
	elif Input.is_action_pressed("izq"):
		_hurtbox_pos.x = -hurtbox_offset.x

	if Input.is_action_pressed("up"):
		_hurtbox_pos.x = 0
		_hurtbox_pos.y = -hurtbox_offset.y * 2
	elif Input.is_action_pressed("down"):
		_hurtbox_pos.x = 0
		_hurtbox_pos.y = hurtbox_offset.y * 2
	else:
		_set_last_position()
	hurtboxPivot.position = _hurtbox_pos

	# Handle def.
	if Input.is_action_pressed("def") and is_on_floor():
		if PlayerController.get_defense_time() < PlayerController.get_defense_time_max():
			_defending = true
			PlayerController.add_defense_time(delta)
		else:
			_defending = false
	else:
		_defending = false
		PlayerController.reset_defense_timer()
	
	# Handle dash.
	if Input.is_action_just_pressed("dash") and PlayerController.get_dash_count() < 1 and !_dashing:
		if !animacion.flip_h:
			velocity.x = walk_velocity * 30
		else:
			velocity.x = -walk_velocity * 30
		PlayerController.add_dash_count(1)
		_dashing = true
	
	if PlayerController.get_dash_time() < PlayerController.get_dash_time_max() and _dashing:
		PlayerController.add_dash_time(delta)
	else:
		_dashing = false
		PlayerController.reset_dash_timer()

	#Handle atack.
	if Input.is_action_just_pressed("atq"):
		hurtbox.monitoring  = true
		hurtbox.monitorable = true
		_atacking = true
	
	# DEBUG: Restore life
	if Input.is_action_just_pressed("health"):
		_health()

	move_and_slide()
	_control_animation()

func _on_hurtbox_hitbox_entered(area: Area2D) -> void:
	if Input.is_action_pressed("down"):
		_control_knockback_atack(area)

func _handle_damage_hitbox():
	for area in hitbox.get_overlapping_areas():
		if area.get_owner().is_in_group("enemy"):
			_control_damage(area)

func _control_damage(body: Node2D):
	if !_defending and !_inmunity:
		PlayerController.subtract_life(1)
		RunScript.add_hit()
		_hit = true
		_inmunity = true
	_control_knockback_damage(body)
	
	print("El personaje jugable recibio daño, VIDA: ",PlayerController.get_life_count())
	print("Muerto: ",PlayerController.is_muerto())

func _control_knockback_damage(body: Node2D):
	# Dirección del golpe
	var direction = sign(global_position.x - body.global_position.x)
	
	# Aplicar knockback
	_knockback.x = direction * (knockback_force_X)
	_knockback.y = knockback_force_Y
	velocity = _knockback

func _control_knockback_atack(area: Area2D):
	# Dirección del golpe
	var direction = sign(global_position.x - area.global_position.x)
	
	# Aplicar knockback
	_knockback.x = direction * (knockback_force_X * 1.5)
	_knockback.y = knockback_force_Y * 1.5
	velocity = _knockback

func _control_animation():
	if animacion.animation == "atack" and animacion.is_playing():
		return
	elif animacion.animation == "hit" and animacion.is_playing():
		return
	
	if !is_on_floor():
		animacion.play("jump")
		if _atacking:
			_atack_animation()
	elif (velocity.x != 0):
		animacion.play("walk")
		if _atacking:
			_atack_animation()
	elif _atacking:
		_atack_animation()
	elif _defending:
		_defense_animation()
	else:
		animacion.play("idle")

	if _dashing:
		animacion.material = blue_shader
	else:
		animacion.material = null
	if _hit:
		animacion.play("hit")
		_hit = false
	if PlayerController.is_muerto():
		animacion.play("dead")

func _atack_animation():	
	animacion.play("atack")
	_atacking = false

func _defense_animation():
	animacion.play("defense")

func _set_last_position():
	if !animacion.flip_h:
		_hurtbox_pos.x = hurtbox_offset.x
		_hurtbox_pos.y = 0
	else:
		_hurtbox_pos.x = -hurtbox_offset.x
		_hurtbox_pos.y = 0

func _health():
	PlayerController.add_life(1)
