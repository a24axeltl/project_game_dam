extends Node

var soundPlayer: AudioStreamPlayer
var musicPlayer: AudioStreamPlayer

func _ready() -> void:
	soundPlayer = AudioStreamPlayer.new()
	add_child(soundPlayer)

func play_sound_button():
	play_sound(preload("res://assets/audio/sound/press_sound/press.mp3"))

func play_victory_melody():
	play_sound(preload("res://assets/audio/music/victory/Victory_Melody.mp3"))

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

func play_sound(path):
	soundPlayer.stream = path
	if soundPlayer.is_playing():
		soundPlayer.stop()
	soundPlayer.play()
