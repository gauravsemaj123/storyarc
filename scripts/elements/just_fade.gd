extends CanvasLayer

signal faded

@onready var animation_player: AnimationPlayer = $AnimationPlayer

func _ready() -> void:
	visible = false

func fadeonly():
	visible = true
	animation_player.play("fade")
	await animation_player.animation_finished
	animation_player.play_backwards("fade")
	faded.emit()
