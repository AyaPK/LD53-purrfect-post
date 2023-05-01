extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	States.current_scene = "turtle_house"

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	change_scenes()

func _on_leave_area_body_entered(body):
	if body.has_method("player"):
		States.transition_scene_to_main_village = true

func change_scenes():
	if States.transition_scene_to_main_village:
		get_tree().change_scene_to_file("res://nodes/main_village.tscn")
		States.finish_changing_scenes("main_village")
