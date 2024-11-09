extends Node2D

@onready var interaction_area: InteractionArea = $InteractionArea
@onready var player: Player = $"../../../sprites/Player"
@onready var inventory: Control = $"../../../../UI/Inventory"
var dialog_inprocess: bool = false

var is_atis_got: bool = false


func _process(_delta: float) -> void:
	if dialog_inprocess == true:
		inventory.close()
		player.dialogactive = true
	else:
		player.dialogactive = false
	if is_atis_got == true:
		InteractionManager.unreg_area(self)
	if Questlines.questline_number != 11:
		position.y = -276
	else:
		position.y = 276
func _ready():
	interaction_area.interact = Callable(self, "_on_interact")
	is_atis_got = false

func _on_interact():
	if Questlines.questline_number != 11:
		pass
	elif Questlines.questline_number == 11:
		if is_atis_got == false:
			DialogueManager.show_example_dialogue_balloon(load("res://scenes/dialogues/lisa.dialogue"), "atisget")
			dialog_inprocess = true
			player.uiactive = true
			await DialogueManager.dialogue_ended
			inventory.add(0)
			dialog_inprocess = false
			player.uiactive = false
			is_atis_got = true
		else:
			pass
		pass
	return
