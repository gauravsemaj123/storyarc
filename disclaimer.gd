extends Control
@onready var player: AnimationPlayer = $player
const mainmenu = preload("res://ui/mainmenu/mainmenu.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	player.play("fadeinout")
	await player.animation_finished
	await get_tree().create_timer(1).timeout
	get_tree().change_scene_to_packed(mainmenu)
