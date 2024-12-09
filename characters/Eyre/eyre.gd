extends Sprite2D
@onready var eyreanim: AnimationPlayer = $eyreanim
@onready var player: Player = $"../Player"

func _ready() -> void:
	GlobalstateQ2.showup.connect(onshow)
	
func onshow(boolean):
	var is_true = bool(boolean)
	if is_true == true:
		player.spriteanims.flip_h = false
		eyreanim.play("in")
		await eyreanim.animation_finished
		eyreanim.play("idle")
	else:
		eyreanim.play_backwards("in")
