extends Node2D

@onready var interaction_area: InteractionArea = $InteractionArea
@onready var player: Player = $"../../../sprites/Player"
@onready var state: Sprite2D = $state
@onready var inventory: Control = $"../../../../UI/Inventory"
var dialog_inprocess: bool = false

func _process(_delta: float) -> void:
	if dialog_inprocess == true:
		inventory.close()
		player.dialogactive = true
	else:
		player.dialogactive = false
	
	if Questlines.questline_number >= 9:
		state.frame = 1
	
func _ready():
	interaction_area.interact = Callable(self, "_on_interact")
	state.frame = 0

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
		player.JUMP_VELOCITY = -600.0
		player.SPEED = 700.0

func _on_interact():
	if Questlines.questline_number != 8:
		DialogueManager.show_example_dialogue_balloon(load("res://scenes/dialogues/lisa.dialogue"), "altarcheck")
		dialog_inprocess = true
		on_openDialog()
		await DialogueManager.dialogue_ended
		dialog_inprocess = false
		on_openDialog()
	elif Questlines.questline_number == 8:
		if state.frame == 0:
			DialogueManager.show_example_dialogue_balloon(load("res://scenes/dialogues/lisa.dialogue"), "altarget")
			dialog_inprocess = true
			on_openDialog()
			await DialogueManager.dialogue_ended
			inventory.add(21)
			Questlines.updateQuest()
			state.frame = 1
			dialog_inprocess = false
			on_openDialog()
		else:
			DialogueManager.show_example_dialogue_balloon(load("res://scenes/dialogues/lisa.dialogue"), "altar_sphere_already")
			dialog_inprocess = true
			on_openDialog()
			await DialogueManager.dialogue_ended
			dialog_inprocess = false
			on_openDialog()
	return
