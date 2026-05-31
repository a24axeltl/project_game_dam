extends Control

@export var label: Label
@export var icon: Sprite2D

func _ready() -> void:
	icon.hide()
	PlayerController.current_life.connect(_update_text)

func _update_text():
	icon.show()
	
	label.modulate.a = 1.5
	icon.modulate.a = 1.5
	label.text = str(PlayerController.get_life_count())
	await get_tree().create_timer(1.0).timeout
	if PlayerController.get_life_count() == PlayerController.get_life_max():
		var label_tween: Tween = create_tween()
		var icon_tween: Tween = create_tween()
		label_tween.tween_property(label, "modulate:a", 0.0, 1.0)
		icon_tween.tween_property(icon, "modulate:a", 0.0, 1.0)
