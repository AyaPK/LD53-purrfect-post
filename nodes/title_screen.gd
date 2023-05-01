extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	MusicController.play_title_music()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_start_game_button_pressed():
	get_tree().change_scene_to_file("res://nodes/world.tscn")
	States.finish_changing_scenes("world")

func _on_credit_screen_button_pressed():
	get_tree().change_scene_to_file("res://nodes/credit_screen.tscn")
