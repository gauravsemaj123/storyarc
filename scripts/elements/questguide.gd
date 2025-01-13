extends Control

@onready var mgagagawin: Label = $mgagagawin
var questtracker: int
@onready var tasklists: VBoxContainer = $tasklists
var is_available = false


func _process(delta: float) -> void:
	tasklists.fillQSlots()
	
	#if !is_available:
		#closelist()
	#else:
		#openlist()

func openlist():
	visible = true

func closelist():
	visible = false

func _ready() -> void:
	visible = true
	tasklists.fillQSlots()

func taskAdd(start):
	var is_pending = false
	for i in QuestTasks.pendingquests:
		if QuestTasks.pendingquests[i]["task"] == QuestTasks.questguideintro[start]["task"]:
			QuestTasks.pendingquests[i]["Count"] += 1
			is_pending = true
	if is_pending == false:
		var tempDic = QuestTasks.questguideintro[start]
		tempDic["Count"] = 1
		QuestTasks.pendingquests[QuestTasks.pendingquests.size()] = tempDic
	print("added")

func taskSuccess(end):
	for i in QuestTasks.pendingquests:
		if QuestTasks.pendingquests[i]["task"] == QuestTasks.questguideintro[end]["task"]:
			QuestTasks.pendingquests[i]["Count"] -= 1
			if QuestTasks.pendingquests[i]["Count"] == 0:
				var tempDic = {}
				for x in QuestTasks.pendingquests:
					if x > i:
						tempDic[x-1] = QuestTasks.pendingquests[x]
					elif x < i:
						tempDic[x] = QuestTasks.pendingquests[x]
				QuestTasks.pendingquests.clear()
				QuestTasks.pendingquests = tempDic
	print("deleted")

func _on_button_pressed() -> void:
	#taskAdd(5)
	pass
