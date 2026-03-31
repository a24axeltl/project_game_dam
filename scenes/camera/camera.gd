extends Camera2D

@export var camera: Camera2D

const camera_position_y: float = -70.00
const camera_movment: float = 100.00
const camera_limit: float = 200.00

func _ready() -> void:
	camera.position.y = camera_position_y
	camera.position.x = 0

func _process(_delta: float) -> void:
	if get_parent().is_in_group("player"):
		if Input.is_action_pressed("up_camera") and camera.position.y > -camera_limit:
			camera.position_smoothing_enabled = true
			camera.position.y = camera.position.y - camera_movment
			print(camera.position.y)
		elif Input.is_action_just_released("up_camera"):
			camera.position.y = camera_position_y
			await get_tree().create_timer(0.5).timeout
			camera.position_smoothing_enabled = false
		
		if Input.is_action_pressed("down_camera") and camera.position.y < camera_limit:
			camera.position_smoothing_enabled = true
			camera.position.y = camera.position.y + camera_movment
		elif Input.is_action_just_released("down_camera"):
			camera.position.y = camera_position_y
			await get_tree().create_timer(0.5).timeout
			camera.position_smoothing_enabled = false
