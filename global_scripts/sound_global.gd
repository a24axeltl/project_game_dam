extends Node

var audioPlayer: AudioStreamPlayer

func _ready() -> void:
	audioPlayer = AudioStreamPlayer.new()
	add_child(audioPlayer)

func play_sound_button():
	play_sound(preload("res://assets/audio/sound/press_sound/press.mp3"))

func play_victory_melody():
	play_sound(preload("res://assets/audio/music/victory/Victory_Melody.mp3"))

func play_sound(path):
	audioPlayer.stream = path
	if audioPlayer.is_playing():
		audioPlayer.stop()
	audioPlayer.play()
