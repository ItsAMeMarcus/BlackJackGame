extends Node2D

var dialog_output = []
var DialogNode

# Called when the node enters the scene tree for the first time.
func _ready():
	DialogNode = $Dialog
	dialog_output.push_back("[b]Olá[/b] mundo!")
	DialogNode.bbcode_text = dialog_output[0]

func add_new_output(output : String):
	$Timer.wait_time = 0.5
	dialog_output.push_back(str(output))
	DialogNode.bbcode_text = dialog_output[-1]

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
