
extends Node

var menu
var Score = 0

func _ready():
	process_mode = PROCESS_MODE_ALWAYS
	menu = get_node_or_null("/root/Game/pause")

func _unhandled_input(event):
	if event.is_action_pressed("pause"):
		menu = get_node_or_null("/root/Game/pause")
		if menu == null:
			
			print("Pause menu not found!")
		else:
			if not menu.visible:
				menu.show()
				set_process(false)  
			else:
				menu.hide()
				set_process(true)   
				
	
func Update_Score(s):
	Score += 1
	var hud = get_node_or_null("/root/Player/Score_UI/hud")
	if hud != null:
		hud.text = "Score: " + str(Global.Score)
		print("S")
	else:
		print("0")

		

