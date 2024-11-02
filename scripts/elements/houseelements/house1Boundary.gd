extends Area2D
@onready var player: Player = $"../../sprites/Player"


@warning_ignore("unused_parameter")
func _on_body_entered(body: Node2D) -> void:
	player.camera_2d.limit_right = 1200
	player.camera_2d.limit_left = -10
