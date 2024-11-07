extends Node2D

@onready var interaction_area: InteractionArea = $InteractionArea
@onready var player: Player = $"../Player"
@onready var inventory: Control = $"../../../UI/Inventory"

var dialog_inprocess: bool = false

func _process(_delta: float) -> void:
	if dialog_inprocess == true:
		inventory.close()
		
	else:
		pass

func _ready():
	interaction_area.interact = Callable(self, "_on_interact")

func _on_interact():
	if inventory.visible != true:
		if Questlines.questline_number == 0:
			DialogueManager.show_example_dialogue_balloon(load("res://scenes/dialogues/lolanita.dialogue"), "start")
			dialog_inprocess = true
			player.uiactive = true
			player.dialogactive = true
			await DialogueManager.dialogue_ended
			player.uiactive = false
			dialog_inprocess = false
			player.dialogactive = false
		else:
			DialogueManager.show_example_dialogue_balloon(load("res://scenes/dialogues/lolanita.dialogue"), "let_them")
			dialog_inprocess = true
			player.uiactive = true
			player.dialogactive = true
			await DialogueManager.dialogue_ended
			player.uiactive = false
			dialog_inprocess = false
			player.dialogactive = false
	else:
		pass
	return
