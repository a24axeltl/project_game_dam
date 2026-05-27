extends Control

@export var containerButton: VBoxContainer
@export var  transcitionScene: Control

func _ready() -> void:
	if !SoundController.is_playing():
		SoundController.play_menu_theme()
	containerButton.modulate.a = 0.0 
	
	_transicition_menu()
	aparecer_menu()

func _transicition_menu():
	transcitionScene.show()
	transcitionScene.to_light_not_load()
	await transcitionScene.transcition
	transcitionScene.hide()

func aparecer_menu() -> void:
	var tween: Tween = create_tween()
	tween.tween_interval(1.5) 
	tween.tween_property(containerButton, "modulate:a", 1.5, 1.5)
