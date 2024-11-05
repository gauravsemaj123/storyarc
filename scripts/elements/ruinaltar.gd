extends Node2D

@onready var interaction_area: InteractionArea = $InteractionArea
@onready var inventory: Control = $"../../../../UI/Inventory"
@onready var player: Player = $"../../../sprites/Player"
@onready var cutscene_manage: AnimationPlayer = $"../../../../Cutscene/CutsceneManage"
@onready var sphere: Sprite2D = $sphere

var dialog_inprocess: bool = false
var sphere_given: bool = false

func _process(delta: float) -> void:
	if dialog_inprocess == true:
		inventory.close()
		player.dialogactive = true
	else:
		player.dialogactive = false
	if sphere_given == true:
		interaction_area.action_name = "Kausapin"

func _ready():
	sphere.visible = false
	interaction_area.interact = Callable(self, "_on_interact")

func _on_interact():
	if inventory.visible != true:
		if sphere_given == true:
			Transition.transition()
			await Transition.on_transition_finished
			get_tree().change_scene_to_file("res://scenes/minigames/minigame1.tscn")
		if sphere_given == false:
			sphere.visible = true
			sphere_given = true
			player.uiactive = true
			dialog_inprocess = true
			cutscene_manage.play("scenebegin")
			await get_tree().create_timer(2).timeout
			cutscene_manage.play("emit")
			await cutscene_manage.animation_finished
			cutscene_manage.play("lightloop")
			await get_tree().create_timer(1).timeout
			DialogueManager.show_example_dialogue_balloon(load("res://scenes/dialogues/eyre.dialogue"), "calling")
			await DialogueManager.dialogue_ended
			cutscene_manage.play("remove")
			player.uiactive = false
			dialog_inprocess = false
		#if Questlines.questline_number == 0:
			#DialogueManager.show_example_dialogue_balloon(load("res://scenes/dialogues/lolanita.dialogue"), "start")
			#dialog_inprocess = true
			#player.uiactive = true
			#await DialogueManager.dialogue_ended
			#dialog_inprocess = false
			#player.uiactive = false
		#else:
			#DialogueManager.show_example_dialogue_balloon(load("res://scenes/dialogues/lolanita.dialogue"), "let_them")
			#dialog_inprocess = true
			#player.uiactive = true
			#await DialogueManager.dialogue_ended
			#dialog_inprocess = false
			#player.uiactive = false
	else:
		pass
	return
