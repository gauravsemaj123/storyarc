extends Node2D

@onready var interaction_area: InteractionArea = $InteractionArea
var dialog_inprocess: bool = false
@onready var inventory: Control = $"../../../UI/Inventory"
@onready var player: Player = $"../Player"


var is_given: bool = false

func _process(_delta: float) -> void:
	if dialog_inprocess == true:
		inventory.close()
		player.dialogactive = true
	else:
		player.dialogactive = false

func _ready():
	interaction_area.interact = Callable(self, "_on_interact")

func _on_interact():
	if Questlines.questline_number != 11:
		DialogueManager.show_example_dialogue_balloon(load("res://scenes/dialogues/matmat.dialogue"), "hionchap1")
		dialog_inprocess = true
		player.uiactive = true
		await DialogueManager.dialogue_ended
		dialog_inprocess = false
		player.uiactive = false
	elif Questlines.questline_number == 11:
		DialogueManager.show_example_dialogue_balloon(load("res://scenes/dialogues/matmat.dialogue"), "sabinieyre")
		dialog_inprocess = true
		player.uiactive = true
		await DialogueManager.dialogue_ended
		if is_given == false:
			inventory.add(5)
			inventory.add(7)
			inventory.add(8)
			inventory.add(10)
			inventory.add(14)
			inventory.add(15)
		else:
			DialogueManager.show_example_dialogue_balloon(load("res://scenes/dialogues/matmat.dialogue"), "kasomeronna")
			await DialogueManager.dialogue_ended
		dialog_inprocess = false
		player.uiactive = false
		
	else:
		pass
	return
