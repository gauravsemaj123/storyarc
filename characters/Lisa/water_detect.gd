extends Area2D

signal water_state_changed(is_in_water:bool)
@onready var splash: AnimatedSprite2D = $"../splash"

var is_in_water: bool = false
var overlapping_areas

func _on_body_entered(_body: Node2D) -> void:
	onsplash()
	AUDIO.sfx("watsplash")
	print("nandito")
	if (is_in_water == false):
		overlapping_areas = get_overlapping_areas()
		
		if(overlapping_areas.size() < 1):
			is_in_water = true
			water_state_changed.emit(is_in_water)
			


func _on_body_exited(_body: Node2D) -> void:
	print("walana")
	overlapping_areas = get_overlapping_areas()
	if (overlapping_areas.size() == 0):
		is_in_water = false
		water_state_changed.emit(is_in_water)

func onsplash():
	print("splash")
	splash.animation = "splash"
	await get_tree().create_timer(0.3, false, false, true).timeout
	splash.animation = "stby"
