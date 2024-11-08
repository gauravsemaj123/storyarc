extends Node2D

@onready var interaction_area: InteractionArea = $InteractionArea
@onready var player: Player = $"../Player"
@onready var inventory: Control = $"../../../UI/Inventory"
@onready var anims: AnimationPlayer = $"../../../UI/anims"

var dialog_inprocess: bool = false

func _process(_delta: float) -> void:
	if dialog_inprocess == true:
		inventory.close()
		anims.pause()
	else:
		pass


func _ready():
	interaction_area.interact = Callable(self, "_on_interact")

func _on_interact():
	if inventory.visible != true:
		if Questlines.questline_number == 1:
			DialogueManager.show_example_dialogue_balloon(load("res://scenes/dialogues/stacey.dialogue"), "start")
			dialog_inprocess = true
			player.uiactive = true
			player.dialogactive = true
			await DialogueManager.dialogue_ended
			player.uiactive = false
			dialog_inprocess = false
			player.dialogactive = false
			anims.play("")
		elif Questlines.questline_number < 1:
			DialogueManager.show_example_dialogue_balloon(load("res://scenes/dialogues/stacey.dialogue"), "frustrated")
			dialog_inprocess = true
			player.uiactive = true
			player.dialogactive = true
			await DialogueManager.dialogue_ended
			player.uiactive = false
			dialog_inprocess = false
			player.dialogactive = false
			anims.play("")
		elif Questlines.questline_number == 12:
			ItemDetection.itemdetect(19)
			if ItemDetection.is_detected == true:
				Cutscene.cutscene_begin()
				player.uiactive = true
				player.dialogactive = true
				dialog_inprocess = true
				await Cutscene.dialog_begin
				DialogueManager.show_example_dialogue_balloon(load("res://scenes/dialogues/stacey.dialogue"), "ihavepen");
				await DialogueManager.dialogue_ended
				player.uiactive = false
				player.dialogactive = false
				dialog_inprocess = false
				Cutscene.just_out()
		else:
			DialogueManager.show_example_dialogue_balloon(load("res://scenes/dialogues/stacey.dialogue"), "get_going")
			dialog_inprocess = true
			player.uiactive = true
			player.dialogactive = true
			await DialogueManager.dialogue_ended
			player.uiactive = false
			dialog_inprocess = false
			player.dialogactive = false
			anims.play("")
	else:
		pass
	return
