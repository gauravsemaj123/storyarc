extends Node2D

@onready var player: Player = $"../../../sprites/Player"
@onready var inventory: Control = $"../../../../UI/Inventory"
@onready var interaction_area: InteractionArea = $InteractionArea
var dialog_inprocess: bool = false

var is_gulay_got: bool = false
var is_permitted: bool = false

func _process(delta: float) -> void:
	if dialog_inprocess == true:
		inventory.close()
		player.dialogactive = true
	else:
		player.dialogactive = false
	if is_gulay_got == true:
		InteractionManager.unreg_area(self)

func _ready():
	interaction_area.interact = Callable(self, "_on_interact")
	is_gulay_got = false

func _on_interact():
	if Questlines.questline_number != 11:
		pass
	elif Questlines.questline_number == 11:
		if is_gulay_got == false and is_permitted == false:
			DialogueManager.show_example_dialogue_balloon(load("res://scenes/dialogues/lisa.dialogue"), "paalammuna")
			dialog_inprocess = true
			player.uiactive = true
			player.dialogactive = true
			await DialogueManager.dialogue_ended
			dialog_inprocess = false
			player.uiactive = false
			player.dialogactive = false
		elif is_gulay_got == false and is_permitted == true:
			DialogueManager.show_example_dialogue_balloon(load("res://scenes/dialogues/lisa.dialogue"), "gulaycrateget")
			dialog_inprocess = true
			player.uiactive = true
			player.dialogactive = true
			await DialogueManager.dialogue_ended
			inventory.add(17)
			inventory.add(16)
			inventory.add(3)
			inventory.add(4)
			inventory.add(6)
			dialog_inprocess = false
			player.uiactive = false
			player.dialogactive = false
		else:
			pass
		pass
	return
