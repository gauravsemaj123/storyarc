extends Node

var is_detected: bool = false

@export var itemFind: String

var selectedVariable

func itemdetection(itemFind):
	var selected = Global.inventory.find_key(itemFind)
	itemsend(selected)
	
func itemsend(selectedVar):
	selectedVariable = selectedVar
	itemdetection(selectedVariable)
	
func itemdetect(currItem):
	var hasItem = false
	for i in Global.inventory:
		if Global.inventory[i]["Name"] == Global.items[currItem]["Name"]:
			Global.inventory[i]["Count"] += 1
			hasItem = true
	is_detected = hasItem
	print(is_detected)
