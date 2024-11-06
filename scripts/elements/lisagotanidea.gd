extends Area2D
@onready var inventory: Control = $"../../../UI/Inventory"
@onready var player: Player = $"../../sprites/Player"

var dialog_inprocess: bool = false

func _process(delta: float) -> void:
	if (dialog_inprocess == true):
		inventory.close()
		player.inventoryactive = false
	else:
		pass

func _on_body_entered(body: Node2D) -> void:
	if Questlines.questline_number == 11:
		DialogueManager.show_example_dialogue_balloon(load("res://scenes/dialogues/lisa.dialogue"), "ithink")
		player.uiactive = true
		player.dialogactive = true
		dialog_inprocess = true
		await DialogueManager.dialogue_ended
		player.uiactive = false
		dialog_inprocess = false
		player.dialogactive = false
	else:
		pass
