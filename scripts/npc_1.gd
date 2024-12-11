extends Node2D

@onready var interaction_area: InteractionArea = $InteractionArea
@onready var player: Player = $"../Player"
@onready var inventory: Control = $"../../../UI/Inventory"

var dialog_inprocess: bool = false
@onready var eyreanim: AnimationPlayer = $"../eyre/eyreanim"


func _process(_delta: float) -> void:
	if dialog_inprocess == true:
		inventory.close()
		
	else:
		pass


func _ready():
	interaction_area.interact = Callable(self, "_on_interact")

func on_openDialog():
	print(dialog_inprocess)
	if dialog_inprocess:
		player.uiactive = true
		player.dialogactive = true
		player.JUMP_VELOCITY = 0
		player.SPEED = 0
	else:
		player.uiactive = false
		player.dialogactive = false
		player.JUMP_VELOCITY = -400
		player.SPEED = 300

func _on_interact():
	if inventory.visible != true:
		if Questlines.questline_number == 0:
			DialogueManager.show_example_dialogue_balloon(load("res://scenes/dialogues/lolanita.dialogue"), "start")
			dialog_inprocess = true
			on_openDialog()
			await DialogueManager.dialogue_ended
			dialog_inprocess = false
			on_openDialog()
		elif Questlines.questline_number == 23:
			DialogueManager.show_example_dialogue_balloon(load("res://scenes/dialogues/lolanita.dialogue"), "itisdone")
			dialog_inprocess = true
			on_openDialog()
			await DialogueManager.dialogue_ended
			dialog_inprocess = false
			on_openDialog()
			TransferrerCutscene.toGoodnight()
		elif Questlines.questline_number == 18:
			DialogueManager.show_example_dialogue_balloon(load("res://scenes/dialogues/lolanita.dialogue"), "itsaprank")
			dialog_inprocess = true
			on_openDialog()
			await DialogueManager.dialogue_ended
			dialog_inprocess = false
			on_openDialog()
	else:
		pass
	return
