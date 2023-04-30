extends Node

func display_dialog_box(dialogue_name):
	Dialogic.VAR.dialog_open = "open"
	var dialoguea = Dialogic.start(dialogue_name)
	add_child(dialoguea)

func _on_timeline_end():
	States.dialogue_open = false
