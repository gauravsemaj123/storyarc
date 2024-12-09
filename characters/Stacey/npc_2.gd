extends Node2D

@onready var interaction_area: InteractionArea = $InteractionArea
@onready var player: Player = $"../Player"
@onready var inventory: Control = $"../../../UI/Inventory"
@onready var animation_player: AnimationPlayer = $AnimationPlayer

var dialog_inprocess: bool = false

func _process(_delta: float) -> void:
	if dialog_inprocess == true:
		inventory.close()
	else:
		pass


func _ready():
	interaction_area.interact = Callable(self, "_on_interact")

func on_openDialog():
	print("dialog_inprocess: " + str(dialog_inprocess))
	if dialog_inprocess:
		animation_player.play("idle")
		player.uiactive = true
		player.dialogactive = true
		player.JUMP_VELOCITY = 0
		player.SPEED = 0
	else:
		player.uiactive = false
		player.dialogactive = false
		player.JUMP_VELOCITY = -600.0
		player.SPEED = 700.0

func _on_interact():
	if inventory.visible != true:
		if Questlines.questline_number == 1:
			DialogueManager.show_example_dialogue_balloon(load("res://scenes/dialogues/stacey.dialogue"), "start")
			dialog_inprocess = true
			on_openDialog()
			await DialogueManager.dialogue_ended
			dialog_inprocess = false
			on_openDialog()
			animation_player.play()
		elif Questlines.questline_number < 1:
			DialogueManager.show_example_dialogue_balloon(load("res://scenes/dialogues/stacey.dialogue"), "frustrated")
			dialog_inprocess = true
			on_openDialog()
			await DialogueManager.dialogue_ended
			dialog_inprocess = false
			on_openDialog()
			animation_player.play()
		elif Questlines.questline_number == 12:
			ItemDetection.itemdetect(19)
			if ItemDetection.is_detected == true:
				Cutscene.cutscene_begin()
				dialog_inprocess = true
				on_openDialog()
				await Cutscene.dialog_begin
				DialogueManager.show_example_dialogue_balloon(load("res://scenes/dialogues/stacey.dialogue"), "ihavepen");
				await DialogueManager.dialogue_ended
				dialog_inprocess = false
				on_openDialog()
				Cutscene.just_out()
		else:
			DialogueManager.show_example_dialogue_balloon(load("res://scenes/dialogues/stacey.dialogue"), "get_going")
			dialog_inprocess = true
			on_openDialog()
			await DialogueManager.dialogue_ended
			dialog_inprocess = false
			on_openDialog()
			animation_player.play()
	else:
		pass
	return
