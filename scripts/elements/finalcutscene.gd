extends Node2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer

func _ready() -> void:
	Weather.sunny()
	animation_player.play("the cutscene")
	await animation_player.animation_finished
	Questlines.questline_number = 23
	TransferrerCutscene.transferCutscene("river", "prev")
