extends VBoxContainer

@export var label_time: Label
@export var label_hit: Label
@export var label_defeated_enemys: Label
@export var label_habilitys: Label
@export var label_damage_upgrade: Label
@export var label_life_upgrade: Label
@export var label_shield_upgrade: Label
@export var label_dash_upgrade: Label
@export var label_explosion_upgrade: Label
@export var label_vertical_atack_upgrade: Label

func _ready() -> void:
	hide_habilitys_upgrades_labels()
	set_text_labels()
	show_habilitys_upgrades_label()

func set_text_labels():
	label_time.text = str("Duración: ",RunScript.get_time())
	label_hit.text = str("Golpes Recibidos: ",RunScript.get_hits())
	label_defeated_enemys.text = str("Enemigos Derrotados: ",RunScript.get_defeated_enemys())
	label_habilitys.text = str("Habilidades Conseguidas: ",RunScript.get_text_habilitys())
	label_damage_upgrade.text = str("Mejoras de Daño: ",RunScript.get_text_damage_upgrades())
	label_life_upgrade.text = str("Mejoras de Vida: ",RunScript.get_text_life_upgrades())
	label_shield_upgrade.text = str("Mejoras del Escudo: ",RunScript.get_text_time_shield_upgrades())
	label_dash_upgrade.text = str("Mejoras del Dash: ",RunScript.get_text_time_dash_upgrades())
	label_explosion_upgrade.text = str("Mejoras de Explosion: ",RunScript.get_text_time_explosion_upgrades())
	label_vertical_atack_upgrade.text = str("Mejoras del AtaqueVertical: ",RunScript.get_text_time_vertical_atack_upgrades())

func hide_habilitys_upgrades_labels():
	label_shield_upgrade.hide()
	label_explosion_upgrade.hide()
	label_vertical_atack_upgrade.hide()
	label_dash_upgrade.hide()

func show_habilitys_upgrades_label():
	if HabilitysController.have_shield():
		label_shield_upgrade.show()
	if HabilitysController.have_explosion_atack():
		label_explosion_upgrade.show()
	if HabilitysController.have_vertical_atack():
		label_vertical_atack_upgrade.show()
	if RunScript.get_num_time_dash_upgrades() > 0:
		label_dash_upgrade.show()
