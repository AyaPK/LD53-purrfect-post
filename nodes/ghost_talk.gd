extends Area2D

@export var reading = false

func _input(event):
	if event.is_action_pressed("ui_accept") and len(get_overlapping_bodies()) > 2 and Dialogic.VAR.dialog_open == "closed":
		DialogueScript.display_dialog_box("ghost_text")
