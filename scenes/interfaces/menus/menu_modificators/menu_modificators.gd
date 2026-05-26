extends Control

@export var vbox_container: VBoxContainer
@export var array_modificators: Array [PackedScene]
@export var transcitionScene: Control

func _ready() -> void:
	vbox_container.modulate.a = 0.0
	visibility_changed.connect(reload)

func next():
	SoundController.stop_music()
	
	transcitionScene.show()
	transcitionScene.to_dark_not_load()
	await transcitionScene.transcition
	
	owner.hide_menu_modificators()
	owner.next_level.call_deferred()

func reload():
	if is_visible_in_tree():
		transcitionScene.show()
		transcitionScene.to_light_white_not_load()
		await transcitionScene.transcition
		SoundController.play_upgrade_theme()
		set_block_signals(true)
		remove_modificators()
		add_modificators()
		set_block_signals(false)
		transcitionScene.hide()
		appear_buttons()

func remove_modificators():
	for modificator in vbox_container.get_children():
		modificator.queue_free()

func add_modificators():
	check_avalible_habilitys()
	if array_modificators.size() <= 0:
		next()
		return
	else:
		array_modificators.shuffle()
		var display_modificators = array_modificators.slice(0,3)
		for modificator_scene in display_modificators:
			var modificator_node = modificator_scene.instantiate()
			vbox_container.add_child(modificator_node)
			
			modificator_node.selected.connect(next)

func check_avalible_habilitys():
	if  HabilitysController.have_shield():
		remove_modificator("res://scenes/modificators/habilitys/full_shield_hability/full_shield_hability.tscn")
		add_modificator(load("res://scenes/modificators/upgrades/time_upgrades/time_amplification/time_shield_amplification/time_shield_amplification.tscn"))
	if HabilitysController.have_explosion_atack():
		remove_modificator("res://scenes/modificators/habilitys/explosion_atack_hability/explosion_atack_hability.tscn")
		add_modificator(load("res://scenes/modificators/upgrades/time_upgrades/time_reduction/time_explosion_reduction/time_explosion_reduction.tscn"))
	if HabilitysController.have_vertical_atack():
		remove_modificator("res://scenes/modificators/habilitys/vertical_atack_hability/vertical_atack_hability.tscn")
		add_modificator(load("res://scenes/modificators/upgrades/time_upgrades/time_reduction/time_vertical_atack_reduction/time_vertical_atack_reduction.tscn"))
	
	if HabilitysController.have_defense_reach_max():
		remove_modificator("res://scenes/modificators/upgrades/time_upgrades/time_amplification/time_shield_amplification/time_shield_amplification.tscn")
	if HabilitysController.have_vertical_atack_reach_max():
		remove_modificator("res://scenes/modificators/upgrades/time_upgrades/time_reduction/time_vertical_atack_reduction/time_vertical_atack_reduction.tscn")
	if HabilitysController.have_explosion_reach_max():
		remove_modificator("res://scenes/modificators/upgrades/time_upgrades/time_reduction/time_explosion_reduction/time_explosion_reduction.tscn")

	if PlayerController.have_dash_reach_max():
		remove_modificator("res://scenes/modificators/upgrades/time_upgrades/time_reduction/time_dash_reduction/time_dash_reduction.tscn")
	if PlayerController.have_life_reach_max():
		remove_modificator("res://scenes/modificators/upgrades/life_upgrade/life_upgrade.tscn")
	if PlayerController.have_damage_reach_max():
		remove_modificator("res://scenes/modificators/upgrades/damage_upgrade/damage_upgrade.tscn")

func remove_modificator(modificator_path: String):
	array_modificators = array_modificators.filter(
		func(scene): return scene.resource_path != modificator_path
	)

func add_modificator(new_scene: PackedScene):
	var exists = array_modificators.any(
		func(scene): return scene.resource_path == new_scene.resource_path
	)
	if not exists:
		array_modificators.append(new_scene)

func appear_buttons() -> void:
	var tween: Tween = create_tween()
	tween.tween_interval(1.5) 
	tween.tween_property(vbox_container, "modulate:a", 1.5, 1.5)
