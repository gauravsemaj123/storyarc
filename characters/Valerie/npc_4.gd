extends Node2D

@onready var interaction_area: InteractionArea = $InteractionArea
@onready var player: Player = $"../Player"
@onready var shop: Control = $"../../../UI/Shop"
@onready var inventory: Control = $"../../../UI/Inventory"

var dialog_inprocess: bool = false
var shop_inprocess: bool = false

var closeDialog: bool = false

func _ready():
	interaction_area.interact = Callable(self, "_on_interact")
	shop.closeDialog.connect(closeDialogInit)

func _process(delta: float) -> void:
	if dialog_inprocess == true:
		inventory.close()
		player.dialogactive = true
		
func closeDialogInit():
	DialogueManager.show_example_dialogue_balloon(load("res://scenes/dialogues/valerie.dialogue"), "thanks")
	await DialogueManager.dialogue_ended
	shop_inprocess = false
	InteractionManager.visible = true
	dialog_inprocess = false
	
func _on_interact():
	if shop.visible != true:
		if Questlines.questline_number == 4:
			DialogueManager.show_example_dialogue_balloon(load("res://scenes/dialogues/valerie.dialogue"), "asktoharold");
			player.uiactive = true
			player.dialogactive = true
			dialog_inprocess = true
			await DialogueManager.dialogue_ended
			player.uiactive = false
			dialog_inprocess = false
			player.dialogactive = false
		else:
			DialogueManager.show_example_dialogue_balloon(load("res://scenes/dialogues/valerie.dialogue"), "shopstart")
			player.dialogactive = true
			dialog_inprocess = true
			await DialogueManager.dialogue_ended
			shop.open()
			shop_inprocess = true
			InteractionManager.visible = false
			player.dialogactive = false

	else:
		pass
	return
	
	if inventory.visible != true:
		if Questlines.questline_number == 4:
			DialogueManager.show_example_dialogue_balloon(load("res://scenes/dialogues/valerie.dialogue"), "asktoharold");
			player.uiactive = true
			player.dialogactive = true
			dialog_inprocess = true
			await DialogueManager.dialogue_ended
			player.uiactive = false
			dialog_inprocess = false
			player.dialogactive = false
		else:
			DialogueManager.show_example_dialogue_balloon(load("res://scenes/dialogues/valerie.dialogue"), "shopstart")
			player.dialogactive = true
			dialog_inprocess = true
			await DialogueManager.dialogue_ended
			shop.open()
			shop_inprocess = true
			InteractionManager.visible = false
			player.dialogactive = false
	else:
		pass
	return

		
