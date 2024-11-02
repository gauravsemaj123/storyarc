extends Control

@onready var quest_provider: TextureRect = $questProvider
@onready var quest_title: RichTextLabel = $questTitle
@onready var quest_desc: RichTextLabel = $questDesc
var questTrack = Questlines.questline_number

func _process(delta: float) -> void:
	#GET QUEST NUMBER
	questTrack = Questlines.questline_number
	#SHOW QUEST
	quest_title.text = Questlines.quest_database[questTrack]["QuestName"]
	quest_desc.text = Questlines.quest_database[questTrack]["QuestDesc"]
	quest_provider.texture = Questlines.quest_database[questTrack]["QuestImage"]
