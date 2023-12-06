extends Node3D
func shoot():
	$muzzel.show()
	$detect.show()
	$Timer.start()

func _on_timer_timeout():
	$muzzel.hide()
	$detect.hide()




