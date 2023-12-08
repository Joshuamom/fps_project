extends Control

var menu = Global.get_node_or_null("/root/Game/pause")

#func _on_Restart_pressed():
#	get_tree().reload_current_scene()
#	Global.reset()

#func _on_Quit_pressed():
#	get_tree().quit()


func _on_quit_pressed():
	get_tree().quit()


func _on_restart_pressed():
	get_tree().reload_current_scene()
	Global.reset()
