extends Area2D
@onready var inventory: Control = $"../../../UI/Inventory"
@onready var player: Player = $"../../sprites/Player"

var dialog_inprocess: bool = false

func _process(_delta: float) -> void:
	if (dialog_inprocess == true):
		inventory.close()
		player.inventoryactive = false
	else:
		pass

func _on_body_entered(_body: Node2D) -> void:
	if Questlines.questline_number == 11:
		DialogueManager.show_example_dialogue_balloon(load("res://scenes/dialogues/lisa.dialogue"), "ithink")
		player.uiactive = true
		player.SPEED = 0
		player.JUMP_VELOCITY = 0
		dialog_inprocess = true
		await DialogueManager.dialogue_ended
		player.uiactive = false
		player.SPEED = 300
		player.JUMP_VELOCITY = -400
		dialog_inprocess = false
	else:
		pass
