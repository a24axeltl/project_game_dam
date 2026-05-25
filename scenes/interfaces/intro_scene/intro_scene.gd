extends Control

@export var filosophicLabel: Label
@export var authorLabel: Label
@export var transcitionScene: Control

func _ready() -> void:
	filosophicLabel.modulate.a = 0.0
	authorLabel.modulate.a = 0.0
	SoundController.play_menu_theme()
	aparecer_texto()

func aparecer_texto() -> void:
	var tween: Tween = create_tween()
	
	tween.tween_interval(1.0) 
	tween.tween_property(filosophicLabel, "modulate:a", 1.0, 1.0)
	
	tween.tween_interval(1.0) 
	tween.tween_property(authorLabel, "modulate:a", 1.0, 1.0)
	
	tween.tween_interval(1.0)
	tween.tween_callback(to_main_menu)

func to_main_menu():
	var loadScene: PackedScene = load("res://scenes/interfaces/menus/menu_main/main_menu.tscn")
	transcitionScene.show()
	transcitionScene.to_dark(loadScene)
