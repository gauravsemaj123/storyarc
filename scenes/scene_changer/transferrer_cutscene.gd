extends CanvasLayer

@onready var animation_player: AnimationPlayer = $AnimationPlayer
var player: Player

@export var is_in_cutscene: bool

const cavespring = preload("res://scenes/maps/genmap/cavespring.tscn")
const farmspring = preload("res://scenes/maps/genmap/farmspring.tscn")
const forestspring = preload("res://scenes/maps/genmap/forestspring.tscn")
const hall = preload("res://scenes/maps/genmap/hall.tscn")
const harold = preload("res://scenes/maps/genmap/harold.tscn")
const house_1 = preload("res://scenes/maps/genmap/house1.tscn")
const river = preload("res://scenes/maps/genmap/river.tscn")
const ruinspring = preload("res://scenes/maps/genmap/ruinspring.tscn")
const shack = preload("res://scenes/maps/genmap/shack.tscn")
const villagespring = preload("res://scenes/maps/genmap/villagespring.tscn")
const goodnight = preload("res://scenes/maps/genmap/goodnight.tscn")

var scene_to_load

func _ready() -> void:
	visible = false

func transferCutscene(destination):
	visible = true
	
	match destination:
		"forestspring":
			scene_to_load = forestspring
		"villagespring":
			scene_to_load = villagespring
		"farmspring":
			scene_to_load = farmspring
		"cavespring":
			scene_to_load = cavespring
		"ruinspring":
			scene_to_load = ruinspring
		"harold":
			scene_to_load = harold
		"house1":
			scene_to_load = house_1
		"river":
			scene_to_load = river
		"shack":
			scene_to_load = shack
		"hall":
			scene_to_load = hall
		"goodnight":
			scene_to_load = goodnight
	
	if destination == "":
		push_error("THE FILE IS MISSING!")
	else:
		animation_player.play("fade")
		await animation_player.animation_finished
		get_tree().call_deferred("change_scene_to_packed", scene_to_load)
		is_in_cutscene = true
		animation_player.play_backwards("fade")
