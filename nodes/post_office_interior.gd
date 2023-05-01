extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	States.current_scene = "post_office_interior"
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	change_scenes()
	
	if Dialogic.VAR.plot.finished_game and not Dialogic.VAR.plot.letter_displayed:
		MusicController.fade_out()
		$letter_scene.fade_in()
		$letter_scene.visible = true

func _on_leave_scene_body_entered(body):
	if body.has_method("player"):
		States.transition_scene_to_world = true

func change_scenes():
	if States.transition_scene_to_world == true:
		get_tree().change_scene_to_file("res://nodes/world.tscn")
		States.finish_changing_scenes("world")

