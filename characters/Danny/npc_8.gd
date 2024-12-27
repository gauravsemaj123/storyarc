extends Node2D

@onready var interaction_area: InteractionArea = $InteractionArea
@onready var player: Player = $"../Player"
@onready var inventory: Control = $"../../../UI/Inventory"

var dialog_inprocess: bool = false

func _process(_delta: float) -> void:
	if dialog_inprocess == true:
		inventory.close()
		
	else:
		pass
		
	if Questlines.questline_number >= 14:
		position.y = 344
	else:
		position.y = -500

func _ready():
	position.y = -238
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
		player.JUMP_VELOCITY = -450
		player.SPEED = 600

func _on_interact():
	if inventory.visible != true:
		AUDIO.stopstream()
		if Questlines.questline_number == 14:
			DialogueManager.show_example_dialogue_balloon(load("res://scenes/dialogues/danny.dialogue"), "ineedhelp")
			dialog_inprocess = true
			on_openDialog()
			await DialogueManager.dialogue_ended
			dialog_inprocess = false
			on_openDialog()
		else:
			DialogueManager.show_example_dialogue_balloon(load("res://scenes/dialogues/danny.dialogue"), "bakanasavillagers")
			dialog_inprocess = true
			on_openDialog()
			await DialogueManager.dialogue_ended
			dialog_inprocess = false
			on_openDialog()
	else:
		pass
	return
		
