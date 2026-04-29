class_name KeyContainer
extends Node

@export var remainKeysLabel: Label

var _total_keys: int
var _collected_keys: int

func _ready() -> void:
	var children := get_children()
	var numbers_of_key: int
	for child in children:
		if child.is_in_group("key"):
			child.key_container = self
			numbers_of_key += 1
	_total_keys = numbers_of_key

func collecte_key():
	SoundController.play_sound_key_pick()
	_collected_keys += 1
	if _collected_keys == _total_keys:
		owner.get_parent().init_menu_modificators()
	remainKeysLabel.text = str(_collected_keys,"/",_total_keys)
