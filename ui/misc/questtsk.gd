extends Control

var specifictask = ""
var is_pending = false
@onready var taskspecific: RichTextLabel = $taskspecific

func _process(_delta):
	if is_pending == true:
		get_node("taskspecific").modulate.a8 = 255
	else:
		get_node("taskspecific").modulate.a8 = 100
	
	get_node("taskspecific").text = specifictask
