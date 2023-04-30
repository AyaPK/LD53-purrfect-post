extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func play_sfx(name, vol):
	var audio = load("res://sounds/"+name+".mp3")
	$Music.stream = audio
	$Music.volume_db = vol
	$Music.play()
