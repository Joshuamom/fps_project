extends Control

@onready score = 

func _ready():
	Update_Score()


func Update_Score():
	$Score.text = "Score: " + str(Global.Score)
