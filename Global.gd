extends Node

func _ready():
	process_mode = PROCESS_MODE_ALWAYS	

func _unhandled_input(event):
	if event.is_action_pressed("menu"):	
		var menu = get_node_or_null("/root/Game/menu")
		print("ovo")
		if menu == null:
			get_tree().quit()
		else:
			if not menu.visible:
				menu.show()
				get_tree().paused = true 	
			else:
				menu.hide()
				get_tree().paused = false
