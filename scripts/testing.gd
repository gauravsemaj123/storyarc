extends Area2D

@onready var inventory: Control = $"../../../../UI/Inventory"

func _on_body_entered(body: Node2D) -> void:
	DialogueManager.show_example_dialogue_balloon(load("res://scenes/dialogues/lisa.dialogue"), "fortestingpurposes")
	inventory.add(21)
