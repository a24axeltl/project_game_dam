extends Control

@export var animationPlayer: AnimationPlayer
signal transcition

func to_light(scene: PackedScene):
	animationPlayer.play("transicion")
	await animationPlayer.animation_finished
	get_tree().change_scene_to_packed(scene)

func to_dark(scene: PackedScene):
	animationPlayer.play("transicion_2")
	await animationPlayer.animation_finished
	get_tree().change_scene_to_packed(scene)

func to_dark_not_load():
	animationPlayer.play("transicion_2")
	await animationPlayer.animation_finished
	transcition.emit()
