extends Node2D

@export var animation: AnimatedSprite2D

func _ready() -> void:
	play_animations()
	SoundController.play_victory_melody()
	RunScript.stop_timer()
	RunScript.save_run_data(true)

func play_animations():
	animation.play("default")
