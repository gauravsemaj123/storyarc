extends CanvasLayer

@onready var animation_player: AnimationPlayer = $AnimationPlayer
var player: Player

@export var is_in_cutscene: bool

func _ready() -> void:
	visible = false

func transferCutscene(destination):
	visible = true
	if destination == "":
		push_error("THE FILE IS MISSING!")
	else:
		var destination_path = "res://scenes/maps/genmap/" + destination + ".tscn"
		animation_player.play("fade")
		await animation_player.animation_finished
		get_tree().call_deferred("change_scene_to_file", destination_path)
		is_in_cutscene = true
		animation_player.play_backwards("fade")
