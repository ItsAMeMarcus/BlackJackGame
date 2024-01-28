extends Node2D

var npc = preload("res://Scenes/npc.tscn")

var current_scene_path
var clown_path
var clown_animation

# Called when the node enters the scene tree for the first time.
func _ready():
	current_scene_path = "/root/" + Global.current_scene_name + "/"
	clown_path = get_node(current_scene_path + "/npcSpawner/Path2D/PathFollow2D")
	clown_animation = get_node(current_scene_path + "/npcSpawner/Path2D/AnimationPlayer")
	spawn()

func spawn():
	Global.is_clown_moving = true
	clown_animation.play("npc_moviment")
	var spawned_npc = npc.instantiate()
	return spawned_npc

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_timer_timeout():
	print("eae")
	#clown_animation.play_backwards("npc_moviment")
	if clown_path.get_child_count() <= 0:
		clown_path.add_child(spawn())
