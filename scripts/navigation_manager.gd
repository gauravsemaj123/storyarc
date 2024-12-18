extends Node

const cavespring = preload("res://scenes/maps/genmap/cavespring.tscn")
const farmspring = preload("res://scenes/maps/genmap/farmspring.tscn")
const forestspring = preload("res://scenes/maps/genmap/forestspring.tscn")
const hall = preload("res://scenes/maps/genmap/hall.tscn")
const harold = preload("res://scenes/maps/genmap/harold.tscn")
const house1 = preload("res://scenes/maps/genmap/house1.tscn")
const river = preload("res://scenes/maps/genmap/river.tscn")
const ruinspring = preload("res://scenes/maps/genmap/ruinspring.tscn")
const shack = preload("res://scenes/maps/genmap/shack.tscn")
const villagespring = preload("res://scenes/maps/genmap/villagespring.tscn")


var currentscene
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
		currentscene = scene_to_load
		if currentscene == ruinspring || currentscene == cavespring:
			Weather.visible = false
			Weather.cloudhide()
		else:
			Weather.visible = true
			Weather.cloudshow()
		
		if scene_to_load == forestspring:
			AUDIO.music("forest")
		elif scene_to_load == villagespring:
			AUDIO.music("village")
		elif scene_to_load == farmspring:
			AUDIO.music("village")
		elif scene_to_load == cavespring:
			AUDIO.music("cave")
		elif scene_to_load == ruinspring:
			AUDIO.music("ruins")
		elif scene_to_load == river:
			AUDIO.music("village")
		elif scene_to_load == shack:
			AUDIO.music("convo")
		elif scene_to_load == harold:
			AUDIO.music("convo")
		elif scene_to_load == hall:
			AUDIO.music("village")
		elif scene_to_load == house1:
			AUDIO.music("convo")
		spawn_door_tag = destination_tag
		get_tree().call_deferred("change_scene_to_packed", scene_to_load)

func trigger_player_spawn(position: Vector2, direction: String):
	on_trigger_player_spawn.emit(position, direction)
