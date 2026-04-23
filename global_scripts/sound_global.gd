extends Node

var musicPlayer: AudioStreamPlayer

func _ready() -> void:
	musicPlayer = AudioStreamPlayer.new()
	add_child(musicPlayer)

func play_sound_button():
	play_sound(preload("res://assets/audio/sound/press_sound/press.mp3"))

func play_victory_melody():
	play_music(preload("res://assets/audio/music/victory/Victory_Melody.mp3"))

func play_sound_damage():
	play_sound(preload("res://assets/audio/sound/damage/damage.mp3"))

func play_sound_atack():
	play_sound(preload("res://assets/audio/sound/punch/punch.mp3"))

func play_sound_key_pick():
	play_sound(preload("res://assets/audio/sound/item_pick/key_pick.mp3"))

func play_sound_explosion():
	play_sound(preload("res://assets/audio/sound/explosion/explosion.mp3"))

func play_sound_vertical_slice():
	play_sound(preload("res://assets/audio/sound/vertical_slice/vertical_slice.mp3"))

func play_sound(stream: AudioStream):
	var soundPlayer = AudioStreamPlayer.new()
	add_child(soundPlayer)
	
	soundPlayer.stream = stream
	soundPlayer.play()
	
	# Señal para que el nodo se borre cuando termine
	soundPlayer.finished.connect(func(): soundPlayer.queue_free())

func play_music(stream: AudioStream):
	musicPlayer.stream = stream
	if musicPlayer.is_playing():
		musicPlayer.stop()
	musicPlayer.play()
