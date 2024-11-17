extends Area2D

@onready var inventory: Control = $"../../../UI/Inventory"
@onready var player: Player = $"../../sprites/Player"
@onready var cutscene_manage: AnimationPlayer = $"../../../Cutscene/CutsceneManage"
@onready var pen: Sprite2D = $"../../sprites/pen"
@onready var miraclelight: PointLight2D = $"../../lighteff/miraclelight"

var dialog_inprocess: bool = false

func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if (dialog_inprocess == true):
		inventory.close()
		
	else:
		pass
	
	if Questlines.questline_number == 11:
		position.y = 566

func _on_body_entered(body: Node2D) -> void:
	print(Questlines.questline_number)
	print(MinigameResources.minigamescore)
	if Questlines.questline_number == 11 and MinigameResources.minigamescore > 7:
			await get_tree().create_timer(2).timeout
			if Questlines.questline_number == 11 and MinigameResources.minigamescore > 10:
				DialogueManager.show_example_dialogue_balloon(load("res://scenes/dialogues/eyre.dialogue"), "success")
				player.uiactive = true
				player.dialogactive = true
				player.SPEED = 0
				player.JUMP_VELOCITY = 0
				dialog_inprocess = true
				await DialogueManager.dialogue_ended
				pen.visible = true
				cutscene_manage.play("give")
				await cutscene_manage.animation_finished
				DialogueManager.show_example_dialogue_balloon(load("res://scenes/dialogues/eyre.dialogue"), "thankyou")
				await DialogueManager.dialogue_ended
				cutscene_manage.play("goodbye")
				await cutscene_manage.animation_finished
				miraclelight.energy = 0
				player.uiactive = false
				player.dialogactive = false
				player.SPEED = 300
				player.JUMP_VELOCITY = -400
				dialog_inprocess = false
				inventory.add(19)
				Notifier.newitemAnnounce("Panulat")
				await get_tree().create_timer(0.5).timeout
				Questlines.updateQuest()
				Notifier.questnext("Stacey")
				miraclelight.visible = false
				queue_free()
			else:
				DialogueManager.show_example_dialogue_balloon(load("res://scenes/dialogues/eyre.dialogue"), "welldone")
				player.uiactive = true
				player.dialogactive = true
				player.SPEED = 0
				player.JUMP_VELOCITY = 0
				dialog_inprocess = true
				await DialogueManager.dialogue_ended
				pen.visible = true
				cutscene_manage.play("give")
				await cutscene_manage.animation_finished
				DialogueManager.show_example_dialogue_balloon(load("res://scenes/dialogues/eyre.dialogue"), "thankyou")
				await DialogueManager.dialogue_ended
				cutscene_manage.play("goodbye")
				await cutscene_manage.animation_finished
				miraclelight.energy = 0
				player.uiactive = false
				player.dialogactive = false
				player.SPEED = 300
				player.JUMP_VELOCITY = -400
				dialog_inprocess = false
				inventory.add(19)
				Notifier.newitemAnnounce("Panulat")
				await get_tree().create_timer(0.5).timeout
				Questlines.updateQuest()
				Notifier.questnext("Stacey")
				miraclelight.visible = false
				queue_free()
