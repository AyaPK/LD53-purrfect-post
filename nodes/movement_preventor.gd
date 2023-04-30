extends Area2D

@export var reading = false

func _process(_delta):
	if Dialogic.VAR.plot.been_to_house == true:
		get_parent().remove_child(self)

func _input(_event):
	if len(get_overlapping_bodies()) > 2 and Dialogic.VAR.dialog_open == "closed":
		var player = get_node("../../Node2D/player")
		player.position.y = player.position.y + 20
		DialogueScript.display_dialog_box("movement_stopper_first")
