extends CanvasLayer

signal on_transition_finished

@onready var animated = $Animated
@onready var animation_player = $AnimationPlayer
@onready var transitionlayer: CanvasLayer = $"."


func _ready():
	animated.visible = false
	animation_player.animation_finished.connect(_on_animation_finished)
	
func _on_animation_finished(anim_name):
	if anim_name == "left_to_right":
		on_transition_finished.emit()
		animation_player.play("right_to_left")
	elif anim_name == "right_to_left":
		animated.visible = false

func transition():
	transitionlayer.layer = 999
	animated.visible = true
	animation_player.play("left_to_right")
