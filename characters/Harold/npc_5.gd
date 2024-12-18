extends Node2D

@onready var interaction_area: InteractionArea = $InteractionArea
@onready var player: Player = $"../Player"
@onready var inventory: Control = $"../../../UI/Inventory"

var dialog_inprocess: bool = false
var is_offering: bool = false
var is_declining: bool = false
@onready var anim: AnimatedSprite2D = $anim

func _ready():
	interaction_area.interact = Callable(self, "_on_interact")

func _process(_delta: float) -> void:
	if (dialog_inprocess == true):
		inventory.close()
		
	else:
		pass

func _on_interact():
	if inventory.visible != true:
		if Questlines.questline_number == 4:
			if is_declining == false and is_offering == false:
				DialogueManager.show_example_dialogue_balloon(load("res://scenes/dialogues/harold.dialogue"), "howcanihelp");
				player.uiactive = true
				player.dialogactive = true
				dialog_inprocess = true
				await DialogueManager.dialogue_ended
				player.uiactive = false
				player.dialogactive = false
				dialog_inprocess = false
				is_declining = true
			elif is_offering == true:
				DialogueManager.show_example_dialogue_balloon(load("res://scenes/dialogues/harold.dialogue"), "theguide");
				player.uiactive = true
				player.dialogactive = true
				dialog_inprocess = true
				await DialogueManager.dialogue_ended
				player.uiactive = false
				player.dialogactive = false
				dialog_inprocess = false
				is_declining = false
		elif Questlines.questline_number == 7:
			DialogueManager.show_example_dialogue_balloon(load("res://scenes/dialogues/harold.dialogue"), "lookwhatifound");
			player.uiactive = true
			player.dialogactive = true
			dialog_inprocess = true
			await DialogueManager.dialogue_ended
			TransferrerCutscene.is_in_cutscene = true
			NavigationManager.go_to_level("ruinspring", "ruin_front")
			return
		elif Questlines.questline_number == 9:
			ItemDetection.itemdetect(21)
			if ItemDetection.is_detected == true:
				Cutscene.cutscene_begin()
				player.uiactive = true
				player.dialogactive = true
				dialog_inprocess = true
				await Cutscene.dialog_begin
				DialogueManager.show_example_dialogue_balloon(load("res://scenes/dialogues/harold.dialogue"), "youhave");
				await DialogueManager.dialogue_ended
				player.uiactive = false
				player.dialogactive = false
				dialog_inprocess = false
				TransferrerCutscene.transferCutscene("ruinspring", "ruin_front")
				Cutscene.just_out()
				return
			else:
				DialogueManager.show_example_dialogue_balloon(load("res://scenes/dialogues/harold.dialogue"), "youdonthave");
				player.uiactive = true
				player.dialogactive = true
				dialog_inprocess = true
				await DialogueManager.dialogue_ended
				player.uiactive = false
				player.dialogactive = false
				dialog_inprocess = false
				return
		else:
			if is_offering == false:
				DialogueManager.show_example_dialogue_balloon(load("res://scenes/dialogues/harold.dialogue"), "hi")
				player.uiactive = true
				player.dialogactive = true
				dialog_inprocess = true
				await DialogueManager.dialogue_ended
				player.uiactive = false
				dialog_inprocess = false
				player.dialogactive = false
				return
			elif is_offering == true:
				DialogueManager.show_example_dialogue_balloon(load("res://scenes/dialogues/harold.dialogue"), "hiwithguide")
				player.uiactive = true
				player.dialogactive = true
				dialog_inprocess = true
				await DialogueManager.dialogue_ended
				player.uiactive = false
				dialog_inprocess = false
				player.dialogactive = false
				return
	else:
		pass


		
