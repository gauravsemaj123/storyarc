extends Area2D
@onready var inventory: Control = $"../../../UI/Inventory"
@onready var npc_5: Node2D = $"../../sprites/npc_5"
@onready var player: Player = $"../../sprites/Player"
@onready var cutscene_manage: AnimationPlayer = $"../../../Cutscene/CutsceneManage"
@onready var for_cutscene: Area2D = $"."
@onready var pen: Sprite2D = $"../../sprites/pen"
@onready var miraclelight: PointLight2D = $"../../lighteff/miraclelight"

var dialog_inprocess: bool = false

func _ready() -> void:
	for_cutscene.position.y = 566

func _process(_delta: float) -> void:
	if (dialog_inprocess == true):
		inventory.close()
		
	else:
		pass

func _on_body_entered(_body: Node2D) -> void:
	print(player)
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
		Questlines.updateQuest()
		Notifier.questnext("")
		for_cutscene.position.y = -566
		
	if Questlines.questline_number == 11 and MinigameResources.storedscore1 > 7:
		await get_tree().create_timer(2).timeout
		print(Questlines.questline_number)
		print(MinigameResources.storedscore1)
		if Questlines.questline_number == 11 and MinigameResources.storedscore1 > 10:
			DialogueManager.show_example_dialogue_balloon(load("res://scenes/dialogues/eyre.dialogue"), "success")
			player.uiactive = true
			player.dialogactive = true
			player.SPEED = 0
			player.JUMP_VELOCITY = 0
			dialog_inprocess = true
			await DialogueManager.dialogue_ended
			pen.visible = true
			cutscene_manage.play("give")
			await cutscene_manage.animation_finished
			DialogueManager.show_example_dialogue_balloon(load("res://scenes/dialogues/eyre.dialogue"), "thankyou")
			await DialogueManager.dialogue_ended
			cutscene_manage.play("goodbye")
			await cutscene_manage.animation_finished
			miraclelight.energy = 0
			player.uiactive = false
			player.dialogactive = false
			player.SPEED = 300
			player.JUMP_VELOCITY = -400
			dialog_inprocess = false
			inventory.add(19)
			Notifier.newitemAnnounce("Panulat")
			miraclelight.visible = false
			for_cutscene.position.y = -566
		elif Questlines.questline_number == 11 and MinigameResources.storedscore1 != 0:
			DialogueManager.show_example_dialogue_balloon(load("res://scenes/dialogues/eyre.dialogue"), "welldone")
			player.uiactive = true
			player.dialogactive = true
			player.SPEED = 0
			player.JUMP_VELOCITY = 0
			dialog_inprocess = true
			await DialogueManager.dialogue_ended
			pen.visible = true
			cutscene_manage.play("give")
			await cutscene_manage.animation_finished
			DialogueManager.show_example_dialogue_balloon(load("res://scenes/dialogues/eyre.dialogue"), "thankyou")
			await DialogueManager.dialogue_ended
			cutscene_manage.play("goodbye")
			await cutscene_manage.animation_finished
			miraclelight.energy = 0
			player.uiactive = false
			player.dialogactive = false
			player.SPEED = 300
			player.JUMP_VELOCITY = -400
			dialog_inprocess = false
			inventory.add(19)
			Notifier.newitemAnnounce("Panulat")
			miraclelight.visible = false
			for_cutscene.position.y = -566
