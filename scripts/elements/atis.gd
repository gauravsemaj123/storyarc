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
		player.JUMP_VELOCITY = -450
		player.SPEED = 600

func _on_interact():
	if Questlines.questline_number != 11:
		pass
	elif Questlines.questline_number == 11:
		if is_atis_got == false:
			DialogueManager.show_example_dialogue_balloon(load("res://scenes/dialogues/lisa.dialogue"), "atisget")
			dialog_inprocess = true
			on_openDialog()
			await DialogueManager.dialogue_ended
			inventory.add(0)
			dialog_inprocess = false
			on_openDialog()
			is_atis_got = true
		else:
			pass
		pass
	return
