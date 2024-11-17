extends Control


func add_item(itemID):

	var texture = load("res://ui/misc/minigames/" + str(MinigameResources.colorMinigame[itemID]["texture"]))
	var placeholder_slottype = MinigameResources.colorMinigame[itemID]["placeholder_slottype"]
	
	var item_data = {"TEXTURE": texture,
				"PLACEHOLDER_TYPE": placeholder_slottype}

	var index = 0
	for i in get_children():
		if i.filled == false:
			index = i.get_index()
			break
	get_child(index).set_Property(item_data)
