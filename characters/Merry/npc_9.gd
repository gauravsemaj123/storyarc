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
		
	if Questlines.questline_number <= 12:
		position.y = -579
	else:
		position.y = 579

func _ready():
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
		player.JUMP_VELOCITY = -600.0
		player.SPEED = 700.0

func _on_interact():
	if inventory.visible != true:
		if Questlines.questline_number == 15:
			if GlobalstateQ2.is_letter_introduced == true:
				DialogueManager.show_example_dialogue_balloon(load("res://scenes/dialogues/merry.dialogue"), "colorblindsirena")
				dialog_inprocess = true
				on_openDialog()
				await DialogueManager.dialogue_ended
				DialogueManager.show_example_dialogue_balloon(load("res://scenes/dialogues/merry.dialogue"), "needbaletter")
				await DialogueManager.dialogue_ended
				inventory.add(23)
				Notifier.newitemAnnounce("Liham")
				dialog_inprocess = false
				on_openDialog()
			else:
				DialogueManager.show_example_dialogue_balloon(load("res://scenes/dialogues/merry.dialogue"), "colorblindsirena")
				dialog_inprocess = true
				on_openDialog()
				await DialogueManager.dialogue_ended
				dialog_inprocess = false
				on_openDialog()
		if Questlines.questline_number == 17:
			DialogueManager.show_example_dialogue_balloon(load("res://scenes/dialogues/merry.dialogue"), "meronkana")
			dialog_inprocess = true
			on_openDialog()
			await DialogueManager.dialogue_ended
			dialog_inprocess = false
			on_openDialog()
			inventory.remove(24)
	else:
		pass
	return
