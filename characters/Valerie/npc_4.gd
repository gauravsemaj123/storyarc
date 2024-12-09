extends Node2D

@onready var interaction_area: InteractionArea = $InteractionArea
@onready var player: Player = $"../Player"
@onready var shop: Control = $"../../../UI/Shop"
@onready var inventory: Control = $"../../../UI/Inventory"
@onready var gulaycrate: Node2D = $"../../AOEs/interactables/gulaycrate"

const MINIGAME_3 = preload("res://scenes/minigames/minigame_3.tscn")

var dialog_inprocess: bool = false
var shop_inprocess: bool = false
var closeDialog: bool = false
@onready var anim: AnimatedSprite2D = $anim
@onready var direction: Marker2D = $direction

func _ready():
	interaction_area.interact = Callable(self, "_on_interact")
	shop.closeDialog.connect(closeDialogInit)

func _process(_delta: float) -> void:
	if (dialog_inprocess == true):
		inventory.close()
		player.dialogactive = true
	else:
		pass
	if (shop_inprocess == true):
		inventory.close()
		player.dialogactive = false
	else:
		pass
		
	if Questlines.questline_number == 3:
		interaction_area.action_name = "Kausapin"
	else:
		interaction_area.action_name = "Bumili"

func closeDialogInit():
	DialogueManager.show_example_dialogue_balloon(load("res://scenes/dialogues/valerie.dialogue"), "thanks")
	await DialogueManager.dialogue_ended
	shop_inprocess = false
	InteractionManager.visible = true
	dialog_inprocess = false
	player.inventoryactive = false
	player.SPEED = 300
	player.uiactive = false
	
func _on_interact():
	if shop.visible != true || inventory.visible != true:
		if Questlines.questline_number == 3:
			DialogueManager.show_example_dialogue_balloon(load("res://scenes/dialogues/valerie.dialogue"), "asktoharold");
			player.uiactive = true
			player.SPEED = 0
			player.JUMP_VELOCITY = 0
			dialog_inprocess = true
			await DialogueManager.dialogue_ended
			player.uiactive = false
			player.SPEED = 300
			player.JUMP_VELOCITY = -400
			dialog_inprocess = false
		elif Questlines.questline_number == 11 and gulaycrate.is_permitted == false:
			DialogueManager.show_example_dialogue_balloon(load("res://scenes/dialogues/valerie.dialogue"), "askpermission")
			player.uiactive = true
			player.SPEED = 0
			player.JUMP_VELOCITY = 0
			dialog_inprocess = true
			await DialogueManager.dialogue_ended
			gulaycrate.is_permitted = true
			player.uiactive = false
			player.SPEED = 300
			player.JUMP_VELOCITY = -400
			dialog_inprocess = false
		elif Questlines.questline_number == 11 and gulaycrate.is_permitted == true:
			DialogueManager.show_example_dialogue_balloon(load("res://scenes/dialogues/valerie.dialogue"), "shopstart")
			player.uiactive = true
			player.SPEED = 0
			dialog_inprocess = true
			await DialogueManager.dialogue_ended
			shop.open()
			player.inventoryactive = true
			shop_inprocess = true
			InteractionManager.visible = false
		elif Questlines.questline_number == 20:
			DialogueManager.show_example_dialogue_balloon(load("res://scenes/dialogues/valerie.dialogue"), "beforetest");
			player.uiactive = true
			player.dialogactive = true
			dialog_inprocess = true
			await DialogueManager.dialogue_ended
			if GlobalstateQ2.listahan_matmat_given == true:
				Transition.transition()
				await Transition.on_transition_finished
				get_tree().call_deferred("change_scene_to_packed", MINIGAME_3)
			player.uiactive = false
			player.dialogactive = false
			dialog_inprocess = false
		else:
			DialogueManager.show_example_dialogue_balloon(load("res://scenes/dialogues/valerie.dialogue"), "shopstart")
			player.uiactive = true
			player.SPEED = 0
			dialog_inprocess = true
			await DialogueManager.dialogue_ended
			shop.open()
			player.inventoryactive = true
			shop_inprocess = true
			InteractionManager.visible = false
		return
	else:
		pass
		
