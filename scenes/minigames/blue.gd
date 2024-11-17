extends Area2D
const blue = preload("res://ui/misc/minigames/blue.png")
const green = preload("res://ui/misc/minigames/green.png")
const violet = preload("res://ui/misc/minigames/violet.png")
@onready var bluesprite: Sprite2D = $Blue


func _on_body_entered(body: Node2D) -> void:
	if body is Red:
		bluesprite.texture = violet
	elif body is Yellow:
		bluesprite.texture = green
	else:
		bluesprite.texture = blue


func _on_body_exited(body: Node2D) -> void:
	bluesprite.texture = blue
