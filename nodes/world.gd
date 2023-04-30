extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	if Dialogic.VAR.plot.first_load == false:
		DialogueScript.display_dialog_box("first_time_text")
	
	
	if States.first_load_in:
		$Node2D/player.position.x = States.player_start_x
		$Node2D/player.position.y = States.player_start_y
		States.first_load_in = false
	elif States.previous_scene == "post_office_interior":
		$Node2D/player.position.x = States.player_exit_post_office_x
		$Node2D/player.position.y = States.player_exit_post_office_y
	elif States.previous_scene == "main_village":
		$Node2D/player.position.x = States.player_exit_village_to_world_x
		$Node2D/player.position.y = States.player_exit_village_to_world_y

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	change_scenes()


func _on_post_office_interior_transition_body_entered(body):
	if body.has_method("player"):
		States.transition_scene_to_post_office = true

func _on_post_office_interior_transition_body_exited(body):
	if body.has_method("player"):
		States.transition_scene_to_post_office = false
		
func _on_main_village_transition_body_entered(body):
	if body.has_method("player"):
		States.transition_scene_to_main_village = true

func change_scenes():
	if States.transition_scene_to_post_office:
		get_tree().change_scene_to_file("res://nodes/post_office_interior.tscn")
		States.finish_changing_scenes("post_office_interior")
	if States.transition_scene_to_main_village:
		get_tree().change_scene_to_file("res://nodes/main_village.tscn")
		States.finish_changing_scenes("main_village")


