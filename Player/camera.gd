extends Node3D
var shooting = false
@onready var raycast = $RayCast3D
func shoot():
	$muzzel.show()
	print("hell")
	if raycast.is_colliding():
		var collider = raycast.get_collider()
		if collider.is_in_group("enemy"):
			$scream.play()
			collider.queue_free()
	shooting = true
	
	$Timer.start()

func _on_timer_timeout():
	$muzzel.hide()
	shooting = false
	


#func _on_detect_area_entered(area):
#	pass

#
#func _on_detect_body_entered(body):
#	if body.name == "enemy":
#		$ding.play()
