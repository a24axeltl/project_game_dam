extends Control

@export var messageLevel: Control
@export var controlTranscition: Control 

func _ready() -> void:
	messageLevel.finish.connect(controlTranscition.init_transcition)
