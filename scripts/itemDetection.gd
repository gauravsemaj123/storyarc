extends Node

var is_detected: bool = false

@export var itemFind: String

var selectedVariable

func itemdetection(item):
	var selected = Global.inventory.find_key(item)
	selectedVariable = selected

func itemdetect(currItem):
	for i in Global.inventory:
		if Global.inventory[i]["Name"] == Global.items[currItem]["Name"]:
			is_detected = true
	print(is_detected)
	
