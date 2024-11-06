extends Node2D

@onready var interaction_area: InteractionArea = $InteractionArea
@onready var player: Player = $"../Player"
@onready var shop: Control = $"../../../UI/Shop"
@onready var inventory: Control = $"../../../UI/Inventory"

var dialog_inprocess: bool = false
var shop_inprocess: bool = false
var closeDialog: bool = false
@onready var anim: AnimatedSprite2D = $anim
@onready var direction: Marker2D = $direction

func _ready():
	interaction_area.interact = Callable(self, "_on_interact")
	shop.closeDialog.connect(closeDialogInit)

func _process(delta: float) -> void:
	if (dialog_inprocess == true):
		inventory.close()
		
	else:
		pass
	if (shop_inprocess == true):
		inventory.close()

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
	player.dialogactive = false
	player.uiactive = false
	
func _on_interact():
	if direction.position.x < player.position.x:
		anim.flip_h = true
		print(anim.flip_h)
	elif direction.position.x > player.position.x:
		anim.flip_h = false
		print(anim.flip_h)
	if shop.visible != true || inventory.visible != true:
		if Questlines.questline_number == 3:
		
			DialogueManager.show_example_dialogue_balloon(load("res://scenes/dialogues/valerie.dialogue"), "asktoharold");
			player.uiactive = true
			player.dialogactive = true
			dialog_inprocess = true
			await DialogueManager.dialogue_ended
			player.uiactive = false
			player.dialogactive = false
			dialog_inprocess = false
		else:
			DialogueManager.show_example_dialogue_balloon(load("res://scenes/dialogues/valerie.dialogue"), "shopstart")
			player.uiactive = true
			player.dialogactive = true
			dialog_inprocess = true
			await DialogueManager.dialogue_ended
			shop.open()
			player.dialogactive = false
			player.inventoryactive = true
			shop_inprocess = true
			InteractionManager.visible = false

	else:
		pass
	
	#if inventory.visible != true:
		#if Questlines.questline_number == 3:
			#DialogueManager.show_example_dialogue_balloon(load("res://scenes/dialogues/valerie.dialogue"), "asktoharold");
			#player.uiactive = true
			#player.dialogactive = true
			#dialog_inprocess = true
			#await DialogueManager.dialogue_ended
			#player.uiactive = false
			#dialog_inprocess = false
			#player.dialogactive = false
		#else:
			#DialogueManager.show_example_dialogue_balloon(load("res://scenes/dialogues/valerie.dialogue"), "shopstart")
			#player.dialogactive = true
			#dialog_inprocess = true
			#await DialogueManager.dialogue_ended
			#shop.open()
			#shop_inprocess = true
			#InteractionManager.visible = false
			#player.dialogactive = false
	#else:
		#pass
	return

		
