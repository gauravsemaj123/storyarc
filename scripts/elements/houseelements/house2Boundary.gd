extends Area2D
@onready var player: Player = $"../../sprites/Player"


func _on_body_entered(body: Node2D) -> void:
	print("entered")
	player.camera_2d.limit_right = 1700
	player.camera_2d.limit_left = -10
