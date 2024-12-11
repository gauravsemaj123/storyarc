extends Node2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer

func _ready() -> void:
	animation_player.play("the cutscene")
	await animation_player.animation_finished
	Questlines.questline_number = 23
	Weather.sunny()
	TransferrerCutscene.transferCutscene("river", "prev")
