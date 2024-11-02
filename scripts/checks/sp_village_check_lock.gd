extends Node2D

@onready var interaction_area: InteractionArea = $InteractionArea
@onready var player: Player = $"../../../sprites/Player"

func _ready():
	interaction_area.interact = Callable(self, "_on_interact")

func _on_interact():
	DialogueManager.show_example_dialogue_balloon(load("res://scenes/dialogues/lisa.dialogue"), "doorlocked")
	player.dialogactive = true
	await DialogueManager.dialogue_ended
	player.dialogactive = false
	return
