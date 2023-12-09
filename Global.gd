
extends Node

var menu
var Score = 0
var health = 0


func _ready():
	process_mode = PROCESS_MODE_ALWAYS
	menu = get_node_or_null("/root/Game/pause")

func reset():
	get_tree().paused = false
	Score = 0
	health = 1

func _unhandled_input(event):
	if event.is_action_pressed("pause"):
		menu = get_node_or_null("/root/Game/pause")
		if menu == null:
			
			print("Pause menu not found!")
		else:
			if not menu.visible:
				get_tree().paused = true
				menu.show()
				set_process(false)  
			else:
				get_tree().paused = false
				menu.hide()
				set_process(true)   
				
func Update_Score(s):
	Score += s
	var hud = get_node_or_null("/root/Game/UI/Score")
	if hud != null:
		hud.text = "Score: " + str(Global.Score)
		check_score_threshold()
		print("i")
	else:
		print("0")
		
func Update_Lives(l):
	if health < 0:
		get_tree().change_scene_to_file("res://UI/end.tscn")
func check_score_threshold():
	var score_threshold = 1000  
	if Score >= score_threshold:
		await get_tree().change_scene_to_file("res://UI/end.tscn")

		

