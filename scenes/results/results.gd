extends Node2D

@export var label_time: Label
@export var label_hit: Label
@export var animation: AnimatedSprite2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	play_animations()
	
	RunScript.stop_timer()
	
	set_text_labels()
	close_program()

func play_animations():
	animation.play("default")

func set_text_labels():
	label_time.text = str("Duración: ",RunScript.get_time())
	label_hit.text = str("Numero de Golpes: ",RunScript.get_hits())

func close_program():
	await get_tree().create_timer(3.0).timeout
	get_tree().quit(0)
