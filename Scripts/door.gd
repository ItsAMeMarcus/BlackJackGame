extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body):
	if body.name == "Player":
		print("entrou")
		Global.is_on_door = true
		


func _on_body_exited(body):
	if body.name == "Player":
		print("saiu")
		Global.is_on_door = false


func _on_rich_text_label_draw():
	pass # Replace with function body.


func _on_rich_text_label_hidden():
	pass # Replace with function body.
