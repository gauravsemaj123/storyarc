extends Node2D

@onready var fade_end: AnimationPlayer = $animations/fade_end

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	await get_tree().create_timer(3).timeout
	DialogueManager.show_example_dialogue_balloon(load("res://scenes/dialogues/lolanita.dialogue"), "goodnightlisa")
	await DialogueManager.dialogue_ended
	await get_tree().create_timer(1).timeout
	fade_end.play("lisasleep")
	await fade_end.animation_finished
	fade_end.play("fadetoend")
