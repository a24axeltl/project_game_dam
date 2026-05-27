extends Control

@export var blackColor: ColorRect

func init_transcition():
	var tween: Tween = create_tween()
	tween.tween_property(blackColor, "modulate:a", 0.0, 1.5)
