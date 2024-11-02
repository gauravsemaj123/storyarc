extends CanvasLayer

class_name level_sign

signal on_stage_finished

@onready var control = $Control
@onready var animation_player = $AnimationPlayer
@onready var label = $Control/TextureRect/Label

func _ready():
	control.visible = false
	animation_player.animation_finished.connect(_on_stage_finished)
	
func _on_stage_finished(anim_name):
	if anim_name == "slide_in":
		on_stage_finished.emit()
		await get_tree().create_timer(1.5, false, false, true).timeout
		animation_player.play("slide_out")
	elif anim_name == "slide_out":
		control.visible = false

func transition():
	control.visible = true
	animation_player.play("slide_in")
	
func stagename_change(stage_tag):
	label.text = stage_tag
