extends VBoxContainer

const questtsk = preload("res://ui/misc/questtsk.tscn")
@onready var tasklists: VBoxContainer = $"."

var questsize: int = 5

func _ready() -> void:
	for i in questsize:
		var taskTemp = questtsk.instantiate()
		add_child(taskTemp)

	fillQSlots()
	
func fillQSlots():
	for i in questsize:
		get_child(i).specifictask = "------------------"
		get_child(i).is_pending = false
	#Fills in inv => slots
	for i in QuestTasks.pendingquests:
		get_child(i).specifictask = QuestTasks.pendingquests[i]["task"]
		get_child(i).is_pending = true
