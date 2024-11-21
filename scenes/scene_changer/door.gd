extends Area2D
class_name Door

@export var destination_level_tag: String
@export var destination_door_tag: String
@export var spawn_direction = "up"
@export var interactable: bool = false

var action_name = "Pumasok"
@onready var player: Player = $"../../sprites/Player"
@onready var spawn = $Spawn
var enterable: bool = false

func _on_body_entered(body):
	if body is Player:
		enterable = true
		print(enterable)
		if interactable == false:
			print("player")
			NavigationManager.go_to_level(destination_level_tag, destination_door_tag)
		if interactable == true:
			DoorInteractionManager.reg_area(self)
			

func changeLayer():
	if Weather.layer == 0:
		print("rainlayer: " + str(Weather.layer))
		Weather.layer = -1
	elif Weather.layer == -1:
		print("rainlayer: " + str(Weather.layer))
		Weather.layer = 0

func _on_body_exited(body):
	enterable = false
	DoorInteractionManager.unreg_area(self)


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("interact") and enterable == true:
		if player.is_on_floor():
			if str(action_name) == "Pumasok":
				NavigationManager.go_to_level(destination_level_tag, destination_door_tag)
				await Transition.on_transition_finished
				changeLayer()
	#pass
