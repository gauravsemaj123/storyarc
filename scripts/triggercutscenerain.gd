extends Area2D
@onready var weatherFilter: ColorRect = $"../../dyn_background/ParallaxBackground/ground/weatherfilter"
@onready var inventory: Control = $"../../../UI/Inventory"
@onready var player: Player = $"../../sprites/Player"

var dialog_inprocess: bool = false

func _process(delta: float) -> void:
	if dialog_inprocess == true:
		inventory.close()
		
	else:
		pass
	if Weather.is_rainy == true:
		Weather.permarain()
		weatherFilter.permanent()

func on_openDialog():
	print("indialog: "+str(dialog_inprocess))
	if dialog_inprocess == true:
		player.uiactive = true
		player.JUMP_VELOCITY = 0
		player.SPEED = 0
	else:
		player.uiactive = false
		player.JUMP_VELOCITY = -600.0
		player.SPEED = 700.0

func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		if Questlines.questline_number == 13 and Weather.is_rainy == false:
			Cutscene.cutscene_begin()
			await Cutscene.dialog_begin
			dialog_inprocess = true
			on_openDialog()
			Weather.rainy()
			weatherFilter.fadeIn()
			DialogueManager.show_example_dialogue_balloon(load("res://scenes/dialogues/lisa.dialogue"), "nakuumuulan")
			await DialogueManager.dialogue_ended
			dialog_inprocess = false
			on_openDialog()
			Cutscene.just_out()
