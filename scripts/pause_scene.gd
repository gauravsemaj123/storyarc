extends Control
@onready var pause_scene = $"."
var is_paused: bool = false

var mainmenu = load("res://ui/mainmenu/mainmenu.tscn")

func _ready():
	pause_scene.visible = false
	$AnimationPlayer.play("RESET")

func paused():
	is_paused = true
	get_tree().paused = true
	pause_scene.visible = true
	$AnimationPlayer.play("pause")

func resume():
	$AnimationPlayer.play_backwards("pause")
	await $AnimationPlayer.animation_finished
	get_tree().paused = false
	pause_scene.visible = false
	$AnimationPlayer.play("RESET")

func _on_resume_pressed():
	print("resume pressed!")
	is_paused = false
	resume()

func _on_save_pressed() -> void:
	print("game saved!")

func _on_main_menu_pressed():
	print("main menu pressed!")
	resume()
	Transition.transition()
	await Transition.on_transition_finished
	get_tree().call_deferred("change_scene_to_packed", mainmenu)

#on esc test
func _on_escape_button():
	if Input.is_action_just_pressed("pause") && !get_tree().paused:
		paused()
	elif Input.is_action_just_pressed("pause") && get_tree().paused:
		resume()
		
func _process(_delta) -> void:
	_on_escape_button()
