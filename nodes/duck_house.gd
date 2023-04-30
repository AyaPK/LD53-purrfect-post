extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	States.current_scene = "duck_house"
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	change_scenes()
	pass

func _on_area_2d_body_entered(body):
	if body.has_method("player"):
		States.transition_scene_to_main_village = true

func change_scenes():
	if States.transition_scene_to_main_village:
		get_tree().change_scene_to_file("res://nodes/main_village.tscn")
		States.finish_changing_scenes("main_village")

