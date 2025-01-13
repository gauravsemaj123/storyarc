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
		position.y = 666

func _on_body_entered(body: Node2D) -> void:
	if Questlines.questline_number == 11 and MinigameResources.minigamescore > 6:
			Questlines.questline_number = 12
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
			removeallitem()
			Notifier.newitemAnnounce("Panulat")
			await get_tree().create_timer(2).timeout
			Questlines.questline_number = 12
			Notifier.questnext("Stacey")
			miraclelight.visible = false
			queue_free()

func removeallitem():
	inventory.remove(0)
	inventory.remove(1)
	inventory.remove(2)
	inventory.remove(3)
	inventory.remove(4)
	inventory.remove(5)
	inventory.remove(6)
	inventory.remove(7)
	inventory.remove(8)
	inventory.remove(9)
	inventory.remove(10)
	inventory.remove(11)
	inventory.remove(12)
	inventory.remove(13)
	inventory.remove(14)
	inventory.remove(15)
	inventory.remove(16)
	inventory.remove(17)
	inventory.remove(18)
	
