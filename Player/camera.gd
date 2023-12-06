extends Node3D

func shoot():
	$muzzel.show()	
	$Timer.start()

func _on_timer_timeout():
	$muzzel.hide()




