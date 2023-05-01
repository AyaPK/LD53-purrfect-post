extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func fade_in():
	$AnimationPlayer.play("letter_fade_in")

func _on_animation_player_animation_finished(anim_name):
	Dialogic.VAR.plot.letter_displayed = "true"
	$AnimationPlayer.stop()
	$PearlsLetter.modulate = ("#ffffff")
	$PearlsLetter.self_modulate = ("#ffffff")
	MusicController.play_title_music()

