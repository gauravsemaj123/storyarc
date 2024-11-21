extends CanvasLayer
@onready var animation_player: AnimationPlayer = $AnimationPlayer

var weatherlayer = layer
var is_rainy = false

func sunny():
	animation_player.play("RESET")

func rainy():
	animation_player.play("initiate weather")
	await animation_player.animation_finished
	is_rainy = true
	
func permarain():
	animation_player.play("PERMARAIN")
