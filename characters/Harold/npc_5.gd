extends Node2D

@onready var interaction_area: InteractionArea = $InteractionArea
@onready var player: Player = $"../Player"
@onready var shop: Control = $"../../../UI/Shop"
@onready var inventory: Control = $"../../../UI/Inventory"

var dialog_inprocess: bool = false

func _ready():
	interaction_area.interact = Callable(self, "_on_interact")

func _process(delta: float) -> void:
	if (dialog_inprocess == true):
		inventory.close()
		
	else:
		pass

func _on_interact():
	if inventory.visible != true:
		if Questlines.questline_number == 4:
			DialogueManager.show_example_dialogue_balloon(load("res://scenes/dialogues/harold.dialogue"), "hi");
			player.uiactive = true
			player.dialogactive = true
			dialog_inprocess = true
			await DialogueManager.dialogue_ended
			player.uiactive = false
			player.dialogactive = false
			dialog_inprocess = false
		else:
			DialogueManager.show_example_dialogue_balloon(load("res://scenes/dialogues/harold.dialogue"), "howcanihelp")
			player.uiactive = true
			player.dialogactive = true
			dialog_inprocess = true
			await DialogueManager.dialogue_ended
			player.uiactive = false
			player.dialogactive = false
			player.dialogactive = false

	else:
		pass
	return

		
