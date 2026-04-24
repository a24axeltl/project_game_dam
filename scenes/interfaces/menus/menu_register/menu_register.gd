extends Control

@export var buttonsContainer: VBoxContainer
@export var labelsContainer: VBoxContainer

func _ready() -> void:
	SoundController.play_register_theme()
	
	labelsContainer.hide()
	var history_data: Dictionary = RunScript.get_history_file_data()
	
	if !history_data.is_empty():
		var size_history = history_data.size()
		for i in size_history:
			var key_name = str("run_",i + 1)
			var run_data: Dictionary = history_data[key_name]
			
			var button_run = Button.new()
			button_run.text = str("Run ",i + 1)
			if  run_data["Success"] == false:
				button_run.add_theme_color_override("font_color",Color.RED)
			
			buttonsContainer.add_child(button_run)
			button_run.pressed.connect(press_button.bind(run_data))

func press_button(run_data: Dictionary):
	RunScript.load_run_data(run_data)
	labelsContainer.show()
	labelsContainer.set_text_labels()
