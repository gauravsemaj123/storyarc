extends Area2D

@onready var npc_5: Node2D = $"../../sprites/npc_5"
@onready var player: Player = $"../../sprites/Player"
@onready var inventory: Control = $"../../../UI/Inventory"

var dialog_inprocess: bool = false

func flipflip():
	await get_tree().create_timer(1).timeout
	player.spriteanims.flip_h = false

func _process(delta: float) -> void:
	if (dialog_inprocess == true):
		inventory.close()
		
	else:
		pass

func _on_body_entered(body: Node2D) -> void:
	if npc_5.is_declining == true and npc_5.is_offering == false:
		flipflip()
		DialogueManager.show_example_dialogue_balloon(load("res://scenes/dialogues/harold.dialogue"), "toobusybutgivesguide2")
		player.uiactive = true
		player.dialogactive = true
		dialog_inprocess = true
		await DialogueManager.dialogue_ended
		player.uiactive = false
		dialog_inprocess = false
		player.dialogactive = false
		npc_5.is_offering = true
		npc_5.is_declining = false
	else:
		pass
