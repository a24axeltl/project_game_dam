extends Control

@export var transcitionScene: Control
@export var label: Label

var advices: Array[String] = []
var advice_file = "res://assets/advices.txt"
var controllerLevelsPath = "res://scenes/controllers/controller_levels/controller_levels.tscn"

func _ready() -> void:
	_load_advices()
	_set_advices()
	transcitionScene.to_light_not_load()
	ResourceLoader.load_threaded_request(controllerLevelsPath)

func _process(_delta: float) -> void:
	var status = ResourceLoader.load_threaded_get_status(controllerLevelsPath)
	
	if status == ResourceLoader.THREAD_LOAD_LOADED:
		var controller = ResourceLoader.load_threaded_get(controllerLevelsPath)
		transcitionScene.to_dark(controller)
func _load_advices():
	if FileAccess.file_exists(advice_file):
		var archivo = FileAccess.open(advice_file, FileAccess.READ)
		while not archivo.eof_reached():
			var linea = archivo.get_line().strip_edges()
			if linea != "":
				advices.append(linea)
	else:
		print("Error: No se encontró el archivo de palabras en " + advice_file)
		advices.append("Cargando...")

func _set_advices():
	advices.shuffle()
	label.text = advices.get(0)
