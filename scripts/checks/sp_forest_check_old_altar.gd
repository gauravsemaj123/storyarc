extends Node2D

@onready var interaction_area: InteractionArea = $InteractionArea
@onready var player: Player = $"../../../sprites/Player"
@onready var state: Sprite2D = $state
@onready var inventory: Control = $"../../../../UI/Inventory"
var dialog_inprocess: bool = false

func _process(delta: float) -> void:
	if dialog_inprocess == true:
		inventory.close()
		player.dialogactive = true
	else:
		player.dialogactive = false

func _ready():
	interaction_area.interact = Callable(self, "_on_interact")
	state.frame = 0

func _on_interact():
	if Questlines.questline_number != 8:
		DialogueManager.show_example_dialogue_balloon(load("res://scenes/dialogues/lisa.dialogue"), "altarcheck")
		dialog_inprocess = true
		player.uiactive = true
		await DialogueManager.dialogue_ended
		dialog_inprocess = false
		player.uiactive = false
	elif Questlines.questline_number == 8:
		if state.frame == 0:
			DialogueManager.show_example_dialogue_balloon(load("res://scenes/dialogues/lisa.dialogue"), "altarget")
			dialog_inprocess = true
			player.uiactive = true
			await DialogueManager.dialogue_ended
			inventory.add(21)
			Questlines.updateQuest()
			state.frame = 1
			dialog_inprocess = false
			player.uiactive = false
		else:
			DialogueManager.show_example_dialogue_balloon(load("res://scenes/dialogues/lisa.dialogue"), "altar_sphere_already")
			dialog_inprocess = true
			player.uiactive = true
			await DialogueManager.dialogue_ended
			dialog_inprocess = false
			player.uiactive = false
	return
