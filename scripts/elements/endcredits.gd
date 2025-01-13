extends Node2D
@onready var abc: AnimationPlayer = $abc


func _ready() -> void:
	abc.play("new_animation")
	AUDIO.ending()
