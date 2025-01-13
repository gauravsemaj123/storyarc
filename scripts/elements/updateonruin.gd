extends Area2D
@onready var player: Player = $"../../sprites/Player"
@onready var questguide: Control = $"../../../UI/questguide"


func _on_body_entered(body: Node2D) -> void:
	if Questlines.questline_number == 6 and body is Player:
		await get_tree().create_timer(.5).timeout
		Questlines.updateQuest()
		Notifier.questnext("Harold")
		questguide.taskSuccess(5)
		questguide.taskAdd(6)
