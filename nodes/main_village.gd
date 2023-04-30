extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	MusicController.play_main_music()
	
	States.current_scene = "main_village"
	if States.previous_scene == "cave_interior":
		$player.position.x = States.player_exit_cave_interior_x
		$player.position.y = States.player_exit_cave_interior_y
	elif States.previous_scene == "duck_house":
		$player.position.x = States.player_exit_duck_house_x
		$player.position.y = States.player_exit_duck_house_y
	elif States.previous_scene == "turtle_house":
		$player.position.x = States.player_exit_turtle_house_x
		$player.position.y = States.player_exit_turtle_house_y
		

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	change_scenes()

func _on_cave_transition_body_entered(body):
	if body.has_method("player"):
		States.transition_scene_to_cave_interior = true

func _on_world_transition_body_entered(body):
	if body.has_method("player"):
		States.transition_scene_to_world = true
		
func _on_duck_house_transition_body_entered(body):
	if body.has_method("player"):
		States.transition_scene_to_duck_house = true

func _on_turtle_house_transition_body_entered(body):
	if body.has_method("player"):
		States.transition_scene_to_turtle_house = true

func change_scenes():
	if States.transition_scene_to_cave_interior:
		get_tree().change_scene_to_file("res://nodes/cave_interior.tscn")
		States.finish_changing_scenes("cave_interior")
	elif States.transition_scene_to_world:
		get_tree().change_scene_to_file("res://nodes/world.tscn")
		States.finish_changing_scenes("world")
	elif States.transition_scene_to_duck_house:
		get_tree().change_scene_to_file("res://nodes/duck_house.tscn")
		States.finish_changing_scenes("duck_house")
	elif States.transition_scene_to_turtle_house:
		get_tree().change_scene_to_file("res://nodes/turtle_house.tscn")
		States.finish_changing_scenes("turtle_house")




