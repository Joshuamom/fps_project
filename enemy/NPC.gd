extends CharacterBody3D

var d = 0
var Dialouge = [
	"David: Hey roomie, you got a nice camera!, I heard it has a powerful flash!"
	, "Me: thanks! :3 i got it on sale, I heard a maze was here"
	, "David: Yeah! theres one nearby, but i cant remember if its by the cave or somewhere else..."
	, "David: but you should watch out, some ghouls are around, the camera might work!"
	, "me: Gotcha! well, i'll just take some photos, maybe of some stange things..."
]

func _ready():
	$AnimationPlayer.play("Idle")
	

func _on_area_3d_body_entered(body):
	$Area3D.queue_free()
	$Dialouge.show()
	$Dialouge/Control/Label.text = Dialouge[d]
	d += 1
	$Dialouge/Timer.start()

func _on_timer_timeout():
	if d < Dialouge.size():
		$Dialouge/Control/Label.text = Dialouge[d]
		d += 1
	else:
		$Dialouge.queue_free()

