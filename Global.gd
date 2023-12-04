#extends Node
#
#func _ready():
#	process_mode = PROCESS_MODE_ALWAYS
#
#func _unhandled_input(event):
#	if event.is_action_pressed("pause"):
#		var menu = get_node_or_null("/root/Game/pause")
#		if menu == null:
#			get_tree().quit()
#		else:
#			if not menu.visible:
#				menu.show()
#				get_tree().paused = true
#			else:
#				menu.hide()
#				get_tree().paused = false
#
#extends Node
#
#var menu
#
#func _ready():
#	process_mode = PROCESS_MODE_ALWAYS
#	menu = get_node_or_null("/root/Game/pause")
#
#func _unhandled_input(event):
#	if event.is_action_pressed("pause"):
#		if menu == null:
#			get_tree().quit()
#		else:
#			if not menu.visible:
#				menu.show()
#				set_process(false)  # Pause processing for the current node
#			else:
#				menu.hide()
#				set_process(true)   # Resume processing for the current node

#extends Node
#
#var menu
#
#func _ready():
#	process_mode = PROCESS_MODE_ALWAYS
#	menu = get_node_or_null("/root/Game/pause")
#
#func _unhandled_input(event):
#	if event.is_action_pressed("pause"):
#		if menu == null:
#			get_tree().quit()
#		else:
#			if not menu.visible:
#				menu.show()
#				set_process(false)  # Pause processing for the current node
#			else:
#				menu.hide()
#				set_process(true)   # Resume processing for the current node
#				menu != null        # Set menu to null after hiding
				
extends Node

var menu

func _ready():
	process_mode = PROCESS_MODE_ALWAYS
	menu = get_node_or_null("/root/Game/pause")

func _unhandled_input(event):
	if event.is_action_pressed("pause"):
		menu = get_node_or_null("/root/Game/pause")
		if menu == null:
			# If pause menu is not found, do nothing or handle it differently
			print("Pause menu not found!")
		else:
			if not menu.visible:
				menu.show()
				set_process(false)  # Pause processing for the current node
			else:
				menu.hide()
				set_process(true)   # Resume processing for the current node

		

