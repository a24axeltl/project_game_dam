extends Node2D

@export var animation: AnimatedSprite2D
@export var transcition: Control

func _ready() -> void:
	transcition.to_light_white_not_load()
	play_animations()
	SoundController.play_results_theme()
	RunScript.stop_timer()
	RunScript.save_run_data(true)
	await transcition.transcition
	transcition.hide()

func play_animations():
	animation.play("default")
