extends Control
@onready var hehe: AnimationPlayer = $hehe

func playin():
	visible = true
	hehe.play("slidein")

func playout():
	hehe.play_backwards("slidein")
	await hehe.animation_finished
	visible = false

func _on_intro_pressed() -> void:
	NavigationManager.go_to_level("forestspring", "intro")


func _on_q_1_pressed() -> void:
	NavigationManager.go_to_level("ruinspring", "ruin_front")
	Questlines.questline_number = 11


func _on_q_2_pressed() -> void:
	NavigationManager.go_to_level("river", "prev")
	Questlines.questline_number = 15


func _on_final_pressed() -> void:
	NavigationManager.go_to_level("farmspring", "house1_ent")
	Questlines.questline_number = 19


func _on_main_pressed() -> void:
	playout()
