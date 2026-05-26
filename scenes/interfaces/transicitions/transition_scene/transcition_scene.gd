extends Control

@export var animationPlayer: AnimationPlayer
signal transcition

func to_light(scene: PackedScene):
	show_black()
	animationPlayer.play("transicion")
	await animationPlayer.animation_finished
	get_tree().change_scene_to_packed(scene)

func to_dark(scene: PackedScene):
	show_black()
	animationPlayer.play("transicion_2")
	await animationPlayer.animation_finished
	get_tree().change_scene_to_packed(scene)

func to_dark_not_load():
	show_black()
	animationPlayer.play("transicion_2")
	await animationPlayer.animation_finished
	transcition.emit()

func to_light_not_load():
	show_black()
	animationPlayer.play("transicion")
	await animationPlayer.animation_finished
	transcition.emit()

func to_light_white(scene: PackedScene):
	show_white()
	animationPlayer.play("transcicion_blanco")
	await animationPlayer.animation_finished
	get_tree().change_scene_to_packed(scene)

func to_dark_white(scene: PackedScene):
	show_white()
	animationPlayer.play("transcicion_blanco_2")
	await animationPlayer.animation_finished
	get_tree().change_scene_to_packed(scene)

func to_dark_white_not_load():
	show_white()
	animationPlayer.play("transcicion_blanco_2")
	await animationPlayer.animation_finished
	transcition.emit()

func to_light_white_not_load():
	show_white()
	animationPlayer.play("transcicion_blanco")
	await animationPlayer.animation_finished
	transcition.emit()

func show_black():
	$BlackColor.show()
	$WhiteColor.hide()

func show_white():
	$BlackColor.hide()
	$WhiteColor.show()
