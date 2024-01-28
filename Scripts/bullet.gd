extends Sprite2D

var direction = false

func init(d):
		direction = d
# Called when the node enters the scene tree for the first time.
func _ready():
	scale = Vector2(.5,.5)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if direction:
		position.x -= 5
	else:
		position.x += 5

func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()

func _on_area_2d_area_entered(area):
	queue_free()

func _on_area_2d_body_entered(body):
	queue_free()
