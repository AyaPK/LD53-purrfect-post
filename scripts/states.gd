extends Node

var current_scene = "world"
var transition_scene_to_post_office = false
var transition_scene_to_world = false
var transition_scene_to_main_village = false
var transition_scene_to_cave_interior = false
var previous_scene = ""

var player_exit_post_office_x = 22
var player_exit_post_office_y = 172

var player_exit_cave_interior_x = 470
var player_exit_cave_interior_y = -200

var player_exit_village_to_world_x = -140
var player_exit_village_to_world_y = -90

var player_start_x = -95
var player_start_y = 394

var first_load_in = true

func finish_changing_scenes(new_scene):
	transition_scene_to_post_office = false
	transition_scene_to_world = false
	transition_scene_to_main_village = false
	transition_scene_to_cave_interior = false
	previous_scene = current_scene
	current_scene = new_scene
