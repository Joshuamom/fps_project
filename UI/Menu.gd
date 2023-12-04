extends Control

var menu = Global.get_node_or_null("/root/Game/pause")


func _on_restart_pressed():
#	get_tree().paused = false
	print("o")
#	get_tree().reload_current_scene()
	get_tree().change_scene_to_file("res://game.tscn")





func _on_quit_pressed():
	get_tree().quit()
	
