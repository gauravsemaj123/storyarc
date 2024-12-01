extends Node2D

@onready var interaction_area: InteractionArea = $InteractionArea
@onready var state: Sprite2D = $state
var dialog_inprocess: bool = false
@onready var inventory: Control = $"../../../UI/Inventory"
@onready var player: Player = $"../../sprites/Player"

@onready var npcu_3: Node2D = $"../../sprites/npcu_3"

var moving: bool = false
@onready var finalposition = $"../../../Marker2D".global_position


func _process(_delta: float) -> void:
	if dialog_inprocess == true:
		inventory.close()
		player.dialogactive = true
	else:
		player.dialogactive = false
	
	if GlobalstateQ2.is_merrychest_opened == true:
		state.frame = 1
	
func _ready():
	Minigame2.visible = false
	interaction_area.interact = Callable(self, "_on_interact")
	state.frame = 0

func go_there():
	player.global_position = finalposition

func on_openDialog():
	print("isindialog? "+str(dialog_inprocess))
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
		if Questlines.questline_number <= 14:
			DialogueManager.show_example_dialogue_balloon(load("res://scenes/dialogues/lisa.dialogue"), "howdotheyknow")
			dialog_inprocess = true
			on_openDialog()
			await DialogueManager.dialogue_ended
			dialog_inprocess = false
			on_openDialog()
		elif Questlines.questline_number >= 15:
			if state.frame == 0 and GlobalstateQ2.is_letter_given != true:
				DialogueManager.show_example_dialogue_balloon(load("res://scenes/dialogues/lisa.dialogue"), "foundmerry")
				dialog_inprocess = true
				on_openDialog()
				await DialogueManager.dialogue_ended
				DialogueManager.show_example_dialogue_balloon(load("res://scenes/dialogues/guard.dialogue"), "wait")
				await DialogueManager.dialogue_ended
				await get_tree().create_timer(.5).timeout
				Transition.transition()
				await Transition.on_transition_finished
				go_there()
				player.spriteanims.flip_h = true
				npcu_3.find_child("AnimatedSprite2D").flip_h = false
				DialogueManager.show_example_dialogue_balloon(load("res://scenes/dialogues/guard.dialogue"), "notallowed")
				await DialogueManager.dialogue_ended
				dialog_inprocess = false
				on_openDialog()
				await get_tree().create_timer(.5).timeout
				npcu_3.find_child("AnimatedSprite2D").flip_h = true
			elif state.frame == 0 and GlobalstateQ2.is_letter_given == true:
				DialogueManager.show_example_dialogue_balloon(load("res://scenes/dialogues/lisa.dialogue"), "itstime")
				dialog_inprocess = true
				on_openDialog()
				await DialogueManager.dialogue_ended
				Minigame2.visible = true
				await Minigame2.doneminigame
				inventory.add(24)
				Notifier.newitemAnnounce("Kwintas")
				dialog_inprocess = false
				on_openDialog()
			else:
				DialogueManager.show_example_dialogue_balloon(load("res://scenes/dialogues/lisa.dialogue"), "itisopened")
				dialog_inprocess = true
				on_openDialog()
				await DialogueManager.dialogue_ended
				dialog_inprocess = false
				on_openDialog()
	else:
		pass
	return
