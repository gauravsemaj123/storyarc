extends Node2D

@onready var interaction_area: InteractionArea = $InteractionArea
@onready var inventory: Control = $"../../../UI/Inventory"
var dialog_inprocess: bool = false
@onready var player: Player = $"../Player"

var item_sequence: int = 0
var itemremove: bool = false
const MINIGAME_1 = preload("res://scenes/minigames/minigame1.tscn")

var is_on_quest11: bool = false
@onready var sphere: Sprite2D = $"../sphere"
@onready var miraclelight: PointLight2D = $"../../lighteff/miraclelight"

func _process(_delta: float) -> void:
	
	if is_on_quest11:
		sphere.visible = true
		miraclelight.texture_scale = 30.38
	
	if item_sequence <= 18:
		interaction_area.action_name = "Ibigay"
	else:
		interaction_area.action_name = "Sabihing tapos na ang misyon"
	if dialog_inprocess == true:
		inventory.close()
		
	else:
		pass
	
	if itemremove == true:
		inventory.remove(item_sequence)

func _ready():
	interaction_area.interact = Callable(self, "_on_interact")

func _on_interact():
	if inventory.visible != true:
		if Questlines.questline_number == 11 and item_sequence <= 18:
			print(item_sequence)
			ItemDetection.itemdetect(item_sequence)
			if ItemDetection.is_detected == true:
				itemremove = true
				await get_tree().create_timer(.1).timeout
				itemremove = false
				DialogueManager.show_example_dialogue_balloon(load("res://scenes/dialogues/eyre.dialogue"), "magaling");
				player.uiactive = true
				player.dialogactive = true
				dialog_inprocess = true
				await DialogueManager.dialogue_ended
				player.uiactive = false
				player.dialogactive = false
				dialog_inprocess = false
				if item_sequence <= 18:
					item_sequence += 1
		elif Questlines.questline_number == 11 and item_sequence >= 19:
			DialogueManager.show_example_dialogue_balloon(load("res://scenes/dialogues/eyre.dialogue"), "beforetest");
			player.uiactive = true
			player.dialogactive = true
			dialog_inprocess = true
			await DialogueManager.dialogue_ended
			Transition.transition()
			await Transition.on_transition_finished
			get_tree().call_deferred("change_scene_to_packed", MINIGAME_1)
			player.uiactive = false
			player.dialogactive = false
			dialog_inprocess = false
	else:
		pass
	return
