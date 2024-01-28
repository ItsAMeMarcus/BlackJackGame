extends Node2D

var dialog_system = preload("res://Scenes/DialogSystem01.tscn").instantiate()
var dialogPath = "res://Roteiro/dialogo.json"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func call_dialog_system():
	if not has_node("DialogSystem01"):
		add_child(dialog_system)
	dialog_system.add_new_output("teste teste, olha o testeeee")
	print(get_dialog())

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func get_dialog():
	var json = JSON.new()
	var file = FileAccess.get_file_as_string(dialogPath)
	var json_text = json.parse(file)
	
	
	
	return json.data


func _on_button_pressed():
	pass # Replace with function body.
