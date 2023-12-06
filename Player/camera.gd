extends Node3D
var vis = false
func shoot():
	$muzzel.show()
	$detect.set_disabled(true)
	var vis = true
	$Timer.start()

func _on_timer_timeout():
	$muzzel.hide()
	$detect.set_disabled(false)
	var vis = false




