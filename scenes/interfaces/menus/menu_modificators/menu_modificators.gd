extends Control

@export var vbox_container: VBoxContainer
@export var array_modificators: Array [PackedScene]

func _ready() -> void:
	for modificator_scene in array_modificators:
		var modificator_node = modificator_scene.instantiate()
		vbox_container.add_child(modificator_node)
		
		modificator_node.selected.connect(next)

func next():
	owner.hide_menu_modificators()
	owner.next_level()
