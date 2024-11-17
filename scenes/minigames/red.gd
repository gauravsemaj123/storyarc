extends Area2D
var orange = preload("res://ui/misc/minigames/orange.png")
var violet = preload("res://ui/misc/minigames/violet.png")
var red = preload("res://ui/misc/minigames/red.png")
@onready var redsprite: Sprite2D = $Red

signal stopred

func _on_body_entered(body: Node2D) -> void:
	if body is Blue:
		await get_tree().create_timer(.1).timeout
		redsprite.texture = violet
		stopred.emit()
	elif body is Yellow:
		await get_tree().create_timer(.1).timeout
		redsprite.texture = orange
		stopred.emit()
	else:
		await get_tree().create_timer(.1).timeout
		redsprite.texture = red
		stopred.emit()


func _on_body_exited(body: Node2D) -> void:
	redsprite.texture = red
