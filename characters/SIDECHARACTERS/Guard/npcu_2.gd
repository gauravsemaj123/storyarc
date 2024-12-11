extends Node2D

@onready var interaction_area: InteractionArea = $InteractionArea
@onready var player: Player = $"../Player"
@onready var inventory: Control = $"../../../UI/Inventory"
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D


var dialog_inprocess: bool = false

func _process(_delta: float) -> void:
	if dialog_inprocess == true:
		inventory.close()
		
	else:
		pass

func doitagain():
	randomrepeatthings()

func randomrepeatthings():
	var randie = randi_range(1,2)
	if randie == 1:
		animated_sprite_2d.animation = "idle"
		animated_sprite_2d.play()
		await animated_sprite_2d.animation_finished
		doitagain()
	else:
		animated_sprite_2d.animation = "idle2"
		animated_sprite_2d.play()
		await animated_sprite_2d.animation_finished
		doitagain()

func _ready():
	randomrepeatthings()
	interaction_area.interact = Callable(self, "_on_interact")

func on_openDialog():
	print(dialog_inprocess)
	if dialog_inprocess:
		player.uiactive = true
		player.dialogactive = true
		player.JUMP_VELOCITY = 0
		player.SPEED = 0
	else:
		player.uiactive = false
		player.dialogactive = false
		player.JUMP_VELOCITY = -400
		player.SPEED = 300

func _on_interact():
	if inventory.visible != true:
		DialogueManager.show_example_dialogue_balloon(load("res://scenes/dialogues/guard.dialogue"), "hello")
		dialog_inprocess = true
		on_openDialog()
		await DialogueManager.dialogue_ended
		dialog_inprocess = false
		on_openDialog()
	else:
		pass
	return
