extends Node2D

var backgroundnumbers = 0
@onready var animation_player = $AnimationPlayer
@onready var cavevar = $cave/ParallaxBackground/cavevar
@onready var plainvar = $plains/ParallaxBackground/plainvar
@onready var forestvar = $forest/ParallaxBackground/forestvar

func _ready():
	$AnimationPlayer.play("menu_intro")
	cavevar.visible = false
	plainvar.visible = false
	
func _process(_delta):
	await get_tree().create_timer(2.5, false, false, true).timeout
	background_transition()
	await get_tree().create_timer(2.5).timeout
	cavevar.visible = true
	plainvar.visible = true

func background_transition():
	animation_player.play("stagesceneswaps")
	if animation_player.animation_finished:
		animation_player.play("stagesceneswaps")


func _on_newgame_pressed():
	NavigationManager.go_to_level("forestspring", "intro")
func _on_options_pressed():
	pass # Replace with function body.

func _on_quit_pressed():
	get_tree().quit()
