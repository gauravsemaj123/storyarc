extends Node2D

@onready var interaction_area: InteractionArea = $InteractionArea
@onready var player: Player = $"../../../sprites/Player"
@onready var inventory: Control = $"../../../../UI/Inventory"

var dialog_inprocess: bool = false

func _process(delta: float) -> void:
	if (dialog_inprocess == true):
		inventory.close()
		player.inventoryactive = false
	else:
		pass

func _ready():
	interaction_area.interact = Callable(self, "_on_interact")

func _on_interact():
	DialogueManager.show_example_dialogue_balloon(load("res://scenes/dialogues/lisa.dialogue"), "doorlocked")
	player.uiactive = true
	player.dialogactive = true
	dialog_inprocess = true
	await DialogueManager.dialogue_ended
	player.uiactive = false
	dialog_inprocess = false
	player.dialogactive = false
	return
