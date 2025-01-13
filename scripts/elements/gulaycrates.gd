extends Node2D

@onready var player: Player = $"../../../sprites/Player"
@onready var inventory: Control = $"../../../../UI/Inventory"
@onready var interaction_area: InteractionArea = $InteractionArea
var dialog_inprocess: bool = false
@onready var questguide: Control = $"../../../../UI/questguide"

func _process(delta: float) -> void:
	if dialog_inprocess == true:
		inventory.close()
		player.dialogactive = true
	else:
		player.dialogactive = false
	if GlobalstateQ2.is_gulaygot == true:
		InteractionManager.unreg_area(self)
	if Questlines.questline_number != 11:
		position.y = -305
	else:
		position.y = 305
func _ready():
	interaction_area.interact = Callable(self, "_on_interact")
	GlobalstateQ2.is_gulaygot = false

func _on_interact():
	if Questlines.questline_number != 11:
		pass
	elif Questlines.questline_number == 11:
		if GlobalstateQ2.is_gulaygot == false and GlobalstateQ2.is_gulaycrate_permitted == false:
			DialogueManager.show_example_dialogue_balloon(load("res://scenes/dialogues/lisa.dialogue"), "paalammuna")
			dialog_inprocess = true
			player.uiactive = true
			player.dialogactive = true
			await DialogueManager.dialogue_ended
			dialog_inprocess = false
			player.uiactive = false
			player.dialogactive = false
		elif GlobalstateQ2.is_gulaygot == false and GlobalstateQ2.is_gulaycrate_permitted == true:
			DialogueManager.show_example_dialogue_balloon(load("res://scenes/dialogues/lisa.dialogue"), "gulaycrateget")
			dialog_inprocess = true
			player.uiactive = true
			player.dialogactive = true
			await DialogueManager.dialogue_ended
			inventory.add(16)
			inventory.add(3)
			inventory.add(4)
			inventory.add(6)
			dialog_inprocess = false
			player.uiactive = false
			player.dialogactive = false
			GlobalstateQ2.is_gulaygot = true
			position.y = -500
			if GlobalstateQ2.is_gulaygot == true and Global.gold == 0:
				questguide.taskSuccess(11)
		else:
			pass
		pass
	return
