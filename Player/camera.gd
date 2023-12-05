extends Node3D


func shoot():
	$lens.show()
	$Timer.start()
func _on_timer_timeout():
	$lens.hide()
