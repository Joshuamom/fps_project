extends CharacterBody3D

const SPEED = 5.0
const JUMP_VELOCITY = 4.5
const MOUSE_SENSITIVITY = 0.030
const MOUSE_RANGE = 1.2
var health = 2
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

func ready():
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	$night.play()

func _unhandled_input(event):
	# if the mouse has moved
	if event is InputEventMouseMotion:
		$pivot.rotate_x(-event.relative.y * MOUSE_SENSITIVITY)
		$pivot.rotation.x = clamp($pivot.rotation.x, -0.5, 0.3)
		rotate_y(-event.relative.x * MOUSE_SENSITIVITY)
		
		
		
func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y -= gravity * delta

	# Handle Jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		

	if Input.is_action_just_pressed("shoot"):
		var weapons = $pivot/weapon
		for w in weapons.get_children():
			if w.has_method("shoot"):
				w.shoot()
				$snap.play()

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir = Input.get_vector("left", "right", "forward", "back")
	var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)

	move_and_slide()

func damage():
	health -= 2
	if health <=0:
		get_tree().change_scene_to_file("res://UI/retry.tscn")

func _on_level_change_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	if body.name == "Player":
		get_tree().change_scene_to_file("res://test/test.tscn")
