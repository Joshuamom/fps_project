extends Node3D

@onready var Player = $Player

func _physics_process(delta):
	get_tree().call_group("enemy", "update_target_location", Player.global_transform.origin)

	
	
