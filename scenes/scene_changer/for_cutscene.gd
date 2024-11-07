extends Area2D
@onready var inventory: Control = $"../../../UI/Inventory"
@onready var npc_5: Node2D = $"../../sprites/npc_5"
@onready var player: Player = $"../../sprites/Player"

var dialog_inprocess: bool = false

func _process(_delta: float) -> void:
	if (dialog_inprocess == true):
		inventory.close()
		
	else:
		pass

func _on_body_entered(_body: Node2D) -> void:
	if Questlines.questline_number == 7 and TransferrerCutscene.is_in_cutscene == true:
		npc_5.position.y = 552
		npc_5.anim.flip_h = false
		await get_tree().create_timer(2).timeout
		npc_5.anim.flip_h = true
		DialogueManager.show_example_dialogue_balloon(load("res://scenes/dialogues/harold.dialogue"), "finallythengivequest")
		player.uiactive = true
		player.dialogactive = true
		dialog_inprocess = true
		await DialogueManager.dialogue_ended
		JustFade.fadeonly()
		await JustFade.faded
		player.uiactive = false
		dialog_inprocess = false
		player.dialogactive = false
		npc_5.position.y = -552
		queue_free()
