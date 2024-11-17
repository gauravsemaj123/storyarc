extends Area2D
const green = preload("res://ui/misc/minigames/green.png")
const orange = preload("res://ui/misc/minigames/orange.png")
const yellow = preload("res://ui/misc/minigames/yellow.png")
@onready var yellowsprite: Sprite2D = $Yellow


func _on_body_entered(body: Node2D) -> void:
	if body is Red:
		yellowsprite.texture = orange
	elif body is Blue:
		yellowsprite.texture = green
	else:
		yellowsprite.texture = yellow


func _on_body_exited(body: Node2D) -> void:
	yellowsprite.texture = yellow
