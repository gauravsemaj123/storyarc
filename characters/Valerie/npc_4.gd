extends Node2D

@onready var interaction_area: InteractionArea = $InteractionArea
@onready var player: Player = $"../Player"
@onready var inventory: Control = $"../../../UI/Inventory"
@onready var questguide: Control = $"../../../UI/questguide"

const MINIGAME_3 = preload("res://scenes/minigames/minigame_3.tscn")

var dialog_inprocess: bool = false
var shop_inprocess: bool = false
var closeDialog: bool = false
@onready var anim: AnimatedSprite2D = $anim
@onready var direction: Marker2D = $direction

func _ready():
	if Questlines.questline_number == 3:
		questguide.taskAdd(3)
	interaction_area.interact = Callable(self, "_on_interact")
	Shop.closeDialog.connect(closeDialogInit)
	readydialogInit()

func readydialogInit():
	if Questlines.questline_number == 21 and GlobalstateQ2.nasabi_na == false:
		await get_tree().create_timer(.5).timeout
		player.spriteanims.flip_h = true
		DialogueManager.show_example_dialogue_balloon(load("res://scenes/dialogues/valerie.dialogue"), "gogetem");
		player.uiactive = true
		player.SPEED = 0
		player.JUMP_VELOCITY = 0
		dialog_inprocess = true
		await DialogueManager.dialogue_ended
		player.uiactive = false
		player.JUMP_VELOCITY = -450
		player.SPEED = 600
		dialog_inprocess = false
		Notifier.questnext("MatMat")
		inventory.add(22)

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
	player.SPEED = 800
	player.uiactive = false
	if GlobalstateQ2.is_gulaygot == true and Global.gold == 0:
		questguide.taskSuccess(11)
	
func _on_interact():
	if Shop.visible != true || inventory.visible != true:
		if Questlines.questline_number == 3:
			DialogueManager.show_example_dialogue_balloon(load("res://scenes/dialogues/valerie.dialogue"), "asktoharold");
			player.uiactive = true
			player.SPEED = 0
			player.JUMP_VELOCITY = 0
			dialog_inprocess = true
			await DialogueManager.dialogue_ended
			player.uiactive = false
			player.JUMP_VELOCITY = -450
			player.SPEED = 600
			dialog_inprocess = false
		elif Questlines.questline_number == 11 and GlobalstateQ2.is_gulaycrate_permitted == false:
			DialogueManager.show_example_dialogue_balloon(load("res://scenes/dialogues/valerie.dialogue"), "askpermission")
			player.uiactive = true
			player.SPEED = 0
			player.JUMP_VELOCITY = 0
			dialog_inprocess = true
			await DialogueManager.dialogue_ended
			GlobalstateQ2.is_gulaycrate_permitted = true
			player.uiactive = false
			player.JUMP_VELOCITY = -450
			player.SPEED = 600
			dialog_inprocess = false
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
			inventory.remove(20)
		else:
			DialogueManager.show_example_dialogue_balloon(load("res://scenes/dialogues/valerie.dialogue"), "shopstart")
			player.uiactive = true
			player.SPEED = 0
			dialog_inprocess = true
			await DialogueManager.dialogue_ended
			Shop.open()
			player.inventoryactive = true
			shop_inprocess = true
			InteractionManager.visible = false
		return
	else:
		pass
		
