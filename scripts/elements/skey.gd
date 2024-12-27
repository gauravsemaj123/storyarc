extends Node2D
@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer

func _ready() -> void:
	animation_player.play("RESET")

func _on_area_2d_body_entered(body: Node2D) -> void:
	if Questlines.questline_number == 1:
		animation_player.play("fadein")


func _on_area_2d_body_exited(body: Node2D) -> void:
	if Questlines.questline_number == 1:
		animation_player.play("RESET")
