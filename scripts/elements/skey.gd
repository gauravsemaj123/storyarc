extends Node2D
@onready var sprite_2d: Sprite2D = $Sprite2D

func _ready() -> void:
	sprite_2d.visible = false

func _on_area_2d_body_entered(body: Node2D) -> void:
	if Questlines.questline_number == 1:
		sprite_2d.visible = true


func _on_area_2d_body_exited(body: Node2D) -> void:
	if Questlines.questline_number == 1:
		sprite_2d.visible = false
