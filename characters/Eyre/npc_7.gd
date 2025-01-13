extends Node2D

@onready var interaction_area: InteractionArea = $InteractionArea
@onready var inventory: Control = $"../../../UI/Inventory"
var dialog_inprocess: bool = false
@onready var player: Player = $"../Player"

var itemremove: bool = false
const MINIGAME_1 = preload("res://scenes/minigames/minigame1.tscn")
@onready var cutscene_manage: AnimationPlayer = $"../../../Cutscene/CutsceneManage"
@onready var npc_7: Node2D = $"."

@onready var sphere: Sprite2D = $"../sphere"
@onready var miraclelight: PointLight2D = $"../../lighteff/miraclelight"

var strings: String
var key: int
func _process(_delta: float) -> void:
	
	if Questlines.questline_number == 11:
		sphere.visible = true
		miraclelight.texture_scale = 30.38
		miraclelight.energy = 1
		
	if  Questlines.questline_number == 12:
		sphere.visible = true
		miraclelight.texture_scale = 0
		miraclelight.energy = 0
	
	if GlobalstateQ2.itemsequence <= 18:
		interaction_area.action_name = "Ibigay"
	else:
		interaction_area.action_name = "Sabihing tapos na ang misyon"
	if dialog_inprocess == true:
		inventory.close()
		
	else:
		pass
	
	if Questlines.questline_number == 12:
		position.y = -550
	
func _ready():
	interaction_area.interact = Callable(self, "_on_interact")

func _on_interact():
	if inventory.visible != true:
		if Questlines.questline_number == 11 and GlobalstateQ2.itemsequence <= 18:
			#strings = str(Global.inventory[0]["Name"])
			#key = Global.inventory.find_key(strings)
			
			#print(strings)
			#print(key)
			print(GlobalstateQ2.itemsequence)
			ItemDetection.itemdetect(GlobalstateQ2.itemsequence)
			if ItemDetection.is_detected == true:
				await get_tree().create_timer(.1).timeout
				DialogueManager.show_example_dialogue_balloon(load("res://scenes/dialogues/eyre.dialogue"), "magaling");
				player.uiactive = true
				player.dialogactive = true
				dialog_inprocess = true
				await DialogueManager.dialogue_ended
				player.uiactive = false
				player.dialogactive = false
				dialog_inprocess = false
				inventory.remove(GlobalstateQ2.itemsequence)
				if GlobalstateQ2.itemsequence <= 18:
					GlobalstateQ2.itemsequence += 1
		elif Questlines.questline_number == 11 and GlobalstateQ2.itemsequence >= 19:
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
		elif Questlines.questline_number == 11 and Global.inventory == null:
			DialogueManager.show_example_dialogue_balloon(load("res://scenes/dialogues/lisa.dialogue"), "none");
			player.uiactive = true
			player.dialogactive = true
			dialog_inprocess = true
			await DialogueManager.dialogue_ended
			player.uiactive = false
			player.dialogactive = false
			dialog_inprocess = false
	else:
		pass
	return
