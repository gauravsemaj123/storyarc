extends Node2D

@onready var interaction_area: InteractionArea = $InteractionArea
@onready var player: Player = $"../Player"
@onready var inventory: Control = $"../../../UI/Inventory"

var dialog_inprocess: bool = false
var is_offering: bool = false
var is_declining: bool = false

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
			if is_declining == false and is_offering == false:
				DialogueManager.show_example_dialogue_balloon(load("res://scenes/dialogues/harold.dialogue"), "howcanihelp");
				player.uiactive = true
				player.dialogactive = true
				dialog_inprocess = true
				await DialogueManager.dialogue_ended
				player.uiactive = false
				player.dialogactive = false
				dialog_inprocess = false
				is_declining = true
			elif is_offering == true:
				DialogueManager.show_example_dialogue_balloon(load("res://scenes/dialogues/harold.dialogue"), "theguide");
				player.uiactive = true
				player.dialogactive = true
				dialog_inprocess = true
				await DialogueManager.dialogue_ended
				player.uiactive = false
				player.dialogactive = false
				dialog_inprocess = false
				is_declining = false
		else:
			if is_offering == false:
				DialogueManager.show_example_dialogue_balloon(load("res://scenes/dialogues/harold.dialogue"), "hi")
				player.uiactive = true
				player.dialogactive = true
				dialog_inprocess = true
				await DialogueManager.dialogue_ended
				player.uiactive = false
				dialog_inprocess = false
				player.dialogactive = false
			elif is_offering == true:
				DialogueManager.show_example_dialogue_balloon(load("res://scenes/dialogues/harold.dialogue"), "hiwithguide")
				player.uiactive = true
				player.dialogactive = true
				dialog_inprocess = true
				await DialogueManager.dialogue_ended
				player.uiactive = false
				dialog_inprocess = false
				player.dialogactive = false
	else:
		pass
	return

		
