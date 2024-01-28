extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite2D.play("npc_default")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body):
	pass

func _on_area_entered(area):
	if area.name == "bullet":
		$AnimatedSprite2D.play("npc_dead")
		$Timer.start()
		Global.is_clown_moving = false
	if area.name.begins_with("Wall"):
		pass


func _on_timer_timeout():
	if is_instance_valid(self):
		self.queue_free()
