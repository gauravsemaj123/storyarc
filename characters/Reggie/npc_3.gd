extends Node2D

@onready var interaction_area: InteractionArea = $InteractionArea
@onready var player: Player = $"../Player"
@onready var inventory: Control = $"../../../UI/Inventory"

var dialog_inprocess: bool = false

func _process(delta: float) -> void:
	if dialog_inprocess == true:
		inventory.close()
		player.dialogactive = true
	else:
		player.dialogactive = false

func _ready():
	interaction_area.interact = Callable(self, "_on_interact")

func _on_interact():
	if inventory.visible != true:
		if Questlines.questline_number == 3:
			DialogueManager.show_example_dialogue_balloon(load("res://scenes/dialogues/reggiethefrog.dialogue"), "start")
			dialog_inprocess = true
			player.uiactive = true
			await DialogueManager.dialogue_ended
			dialog_inprocess = false
			player.uiactive = false
		else:
			DialogueManager.show_example_dialogue_balloon(load("res://scenes/dialogues/reggiethefrog.dialogue"), "unrecognized")
			dialog_inprocess = true
			player.uiactive = true
			await DialogueManager.dialogue_ended
			dialog_inprocess = false
			player.uiactive = false
	else:
		pass
	return
		
