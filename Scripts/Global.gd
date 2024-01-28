extends Node

var is_attacking = false

var is_on_door = false

var is_jumping = false

var is_clown_moving = true

var current_scene_name

# Called when the node enters the scene tree for the first time.
func _ready():
	current_scene_name = get_tree().get_current_scene().name


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
