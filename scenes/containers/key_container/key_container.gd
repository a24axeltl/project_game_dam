class_name KeyContainer
extends Node

@export var remainKeysLabel: Label

var _total_keys: int
var _collected_keys: int

func _ready() -> void:
	var keys := get_children()
	_total_keys = keys.size()
	for key in keys:
		key.key_container = self

func collecte_key():
	SoundController.play_sound_key_pick()
	_collected_keys += 1
	if _collected_keys == _total_keys:
		owner.get_parent().init_menu_modificators()
	remainKeysLabel.text = str(_collected_keys,"/",_total_keys)
