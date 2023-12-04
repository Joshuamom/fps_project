extends Node

func _unhandled_input(event):
	if event.is_action_pressed("menu"):	
		var menu = get_node_or_null("/root/game/menu")
		if menu == null:
			get_tree().quit()
		else:
			if not menu.visible:
				menu.show()
				get_tree().paused = true 	
			else:
				menu.hide()
				get_tree().paused = false
