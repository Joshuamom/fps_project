extends CharacterBody3D

@onready var nav_agent = $NavigationAgent3D
const SPEED = 5.0
const JUMP_VELOCITY = 4.5

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")


func damage():
	
	$scream.play()
	$sparkel2.emitting = true

	# Update the score (assuming Global is a singleton or some global script)
	Global.Update_Score(100)
	
	$Timer.start()

  


func _on_timer_timeout():
	queue_free()




#func _physics_process(delta):
#	# Add the gravity.
#	if not is_on_floor():
#		var current_location = global_transform.origin
#		var next_loc = nav_agent.get_next_location
#		var new_vel = (next_loc - current_location).normalized * SPEED
#		velocity = new_vel
#
#
#	move_and_slide()
#func update_target_location(target_location):
#	nav_agent.set_target_location(target_location)


