extends Node2D

@onready var player = get_tree().get_first_node_in_group("player")
@onready var texture_rect = $Control/TextureRect
@onready var label = $Label


var active_areas = []
var can_interact = true

func reg_area(area):
	active_areas.push_back(area)

func unreg_area(area):
	var index = active_areas.find(area)
	if index != -1:
		active_areas.remove_at(index)

func _process(_delta):
	if active_areas.size() > 0 && can_interact:
		active_areas.sort_custom(_sort_by_distance_to_player)
		label.text = active_areas[0].action_name
		label.global_position = active_areas[0].global_position
		label.global_position.y -= -120
		label.global_position.x -= label.size.x / 1.5
		label.show()
		texture_rect.global_position = active_areas[0].global_position
		texture_rect.global_position.y -= -170
		texture_rect.global_position.x -= label.size.x / 5
		texture_rect.show()
	else:
		label.hide()
		texture_rect.hide()

func _sort_by_distance_to_player(area1, area2):
	var area_1_to_player = player.global_position.distance_to(area1.global_position)
	var area_2_to_player = player.global_position.distance_to(area2.global_position)
	return area_1_to_player < area_2_to_player
