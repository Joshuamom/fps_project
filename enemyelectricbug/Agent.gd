extends CharacterBody3D

@onready var NA = $NavigationAgent3D
const SPEED = 1.5
func _ready():
	$AnimationPlayer.play("Walk")
	
	

func _physics_process(delta):
	var player = get_node_or_null("/root/Game/Player")
	if player != null:
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
