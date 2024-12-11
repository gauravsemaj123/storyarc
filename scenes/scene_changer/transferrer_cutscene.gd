extends CanvasLayer

@onready var animation_player: AnimationPlayer = $AnimationPlayer
var player: Player

@export var is_in_cutscene: bool
const goodnight = preload("res://scenes/maps/genmap/goodnight.tscn")
var scene_to_load
const finalcutscene = preload("res://scenes/maps/genmap/finalcutscene.tscn")
func _ready() -> void:
	visible = false

func toFinal():
	visible = true
	animation_player.play("fade")
	await animation_player.animation_finished
	get_tree().call_deferred("change_scene_to_packed", finalcutscene)
	is_in_cutscene = true
	animation_player.play_backwards("fade")

func toGoodnight():
	visible = true
	animation_player.play("fade")
	await animation_player.animation_finished
	get_tree().call_deferred("change_scene_to_packed", goodnight)
	is_in_cutscene = true
	animation_player.play_backwards("fade")

func transferCutscene(level_tag2, destination_tag2):
	visible = true
	
	if destination_tag2 == "" and level_tag2 == "":
		push_error("MISSING!")
	else:
		animation_player.play("fade")
		await animation_player.animation_finished
		NavigationManager.go_to_level(level_tag2, destination_tag2)
		is_in_cutscene = true
		animation_player.play_backwards("fade")
