extends Area2D
@onready var splash = $"../../sprites/Player/splash"
@onready var player: Player = $"../../sprites/Player"

func _on_body_entered(_body):
	print("body entered")
	splash.animation = "splash"
	await get_tree().create_timer(0.5, false, false, true).timeout
	splash.animation = "stby"
	player.velocity.y -= 1
	
func _on_body_exited(_body):
	print("body exit")
	splash.animation = "stby"
