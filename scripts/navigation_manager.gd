extends Node

const forestspring = "res://scenes/maps/genmap/forestspring.tscn"
const villagespring = "res://scenes/maps/genmap/villagespring.tscn"
const farmspring = "res://scenes/maps/genmap/farmspring.tscn"
const cavespring = "res://scenes/maps/genmap/cavespring.tscn"
const ruinspring = "res://scenes/maps/genmap/ruinspring.tscn"
const harold = "res://scenes/maps/genmap/harold.tscn"
const house1 = "res://scenes/maps/genmap/house1.tscn"
const river = "res://scenes/maps/genmap/river.tscn"
const shack = "res://scenes/maps/genmap/shack.tscn"
const hall = "res://scenes/maps/genmap/hall.tscn"


@export var currentscene: String
signal on_trigger_player_spawn

var spawn_door_tag

func go_to_level(level_tag, destination_tag):
	var scene_to_load
	var stage_tag
	
	match level_tag:
		"forestspring":
			scene_to_load = forestspring
			stage_tag = "Evisu Forest"
		"villagespring":
			scene_to_load = villagespring
			stage_tag = "Happy Village"
		"farmspring":
			scene_to_load = farmspring
			stage_tag = "Farm"
		"cavespring":
			scene_to_load = cavespring
			stage_tag = "Mystic Cave"
		"ruinspring":
			scene_to_load = ruinspring
			stage_tag = "Ancient Ruins"
		"harold":
			scene_to_load = harold
			stage_tag = "Harold's House"
		"house1":
			scene_to_load = house1
			stage_tag = "House"
		"river":
			scene_to_load = river
			stage_tag = "Hange River"
		"shack":
			scene_to_load = shack
			stage_tag = "Shack"
		"hall":
			scene_to_load = hall
			stage_tag = "Happy Hall"
	 
	if scene_to_load != null:
		Transition.transition()
		await Transition.on_transition_finished
		Signage.transition()
		Signage.stagename_change(stage_tag)
		currentscene = str(scene_to_load)
		spawn_door_tag = destination_tag
		Loader.goto_level(scene_to_load)

func trigger_player_spawn(position: Vector2, direction: String):
	on_trigger_player_spawn.emit(position, direction)
