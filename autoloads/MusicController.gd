extends Node2D

var main_music = load("res://sounds/main_music.mp3")
var cave_music = load("res://sounds/cave_music.mp3")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func play_main_music():
	if States.current_music != "main_music":
		States.current_music = "main_music"
		$Music.stream = main_music
		$Music.volume_db = 0
		$Music.play()

func play_cave_music():
	if States.current_music != "cave_music":
		States.current_music = "cave_music"
		$Music.stream = cave_music
		$Music.volume_db = -12
		$Music.play()
