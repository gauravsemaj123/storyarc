extends Area2D

@onready var inventory: Control = $"../../../UI/Inventory"
@onready var npc_5: Node2D = $"../../sprites/npc_5"
@onready var player: Player = $"../../sprites/Player"
@onready var cutscene_manage: AnimationPlayer = $"../../../Cutscene/CutsceneManage"
@onready var for_cutscene_2: Area2D = $"../FOR_CUTSCENE2"


var dialog_inprocess: bool = false

func _ready() -> void:
	for_cutscene_2.position.y = -566

func _process(_delta: float) -> void:
	if (dialog_inprocess == true):
		inventory.close()
		
	else:
		pass

func _on_body_entered(body: Node2D) -> void:
	print(player)
	if Questlines.questline_number == 7 and TransferrerCutscene.is_in_cutscene == true:
		if body is Player:
			npc_5.position.y = 552
			npc_5.anim.flip_h = false
			await get_tree().create_timer(1.5).timeout
			npc_5.anim.flip_h = true
			DialogueManager.show_example_dialogue_balloon(load("res://scenes/dialogues/harold.dialogue"), "finallythengivequest")
			player.uiactive = true
			player.dialogactive = true
			player.SPEED = 0
			player.JUMP_VELOCITY = 0
			dialog_inprocess = true
			await DialogueManager.dialogue_ended
			JustFade.fadeonly()
			await JustFade.faded
			player.uiactive = false
			dialog_inprocess = false
			player.SPEED = 300
			player.JUMP_VELOCITY = -400
			player.dialogactive = false
			npc_5.position.y = -552
			Questlines.updateQuest()
			Notifier.questnext("")
			for_cutscene_2.position.y = 566
			queue_free()
