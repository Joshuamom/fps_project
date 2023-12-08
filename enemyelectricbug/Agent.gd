extends CharacterBody3D

@onready var NA = $NavigationAgent3D
var is_paused = false
const SPEED = .7
var dying = false
var attack = false
func _ready():
	$AnimationPlayer.play("Walk")
	
	

func _physics_process(delta):
	if not is_paused: # just added
		var player = get_node_or_null("/root/Game/Player")
		if player != null and not dying and not attack:
			look_at(player.global_position)
			NA.set_target_position(player.global_position)
			var current_position = global_position
			var next_position = NA.get_next_path_position()
			var new_velocity = (next_position - current_position).normalized() * SPEED
			velocity = new_velocity
		if !is_on_floor():
			velocity.y -= 9.8
		else:
			velocity.y = 0
		move_and_slide()


func _on_area_3d_body_entered(body):
	if not dying:
		attack = true
		$AnimationPlayer.play("Attack")
		$Timer2.start()
		

func _on_area_3d_body_exited(body):
	if not dying:
		attack = false
#		$AnimationPlayer.play("Walk")
		
func damage():
	dying = true
	$blood.emitting = true
	$death_sound.play()
	$AnimationPlayer.play("Death")
	velocity = Vector3.ZERO
	Global.Update_Score(100)
	$Timer.start()
		


func _on_timer_timeout():
	queue_free()





#func _on_timer_2_timeout():
#	for b in $Area3D.overlaps_body():
#		if b.has_method("damage"):
#			b.damage()
