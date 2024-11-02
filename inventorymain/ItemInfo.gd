extends Control

var ItemName = ""
var ItemDes = ""
var ItemCost = 0
var ItemCount = 0


func updateInfo():
	get_node("Title").text = ItemName
	get_node("Des").text = ItemDes

func _on_use_pressed():
#	REMOVE ITEM
	for i in Global.inventory:
		if Global.inventory[i]["Name"] == ItemName:
			ItemCount -= 1
			if ItemCount == 0:
				#Remove item from inventory, then update the inventory 
				var tempDic = {}
				for x in Global.inventory:
					if x > i:
						tempDic[x-1] = Global.inventory[x]
					elif x < i:
						tempDic[x] = Global.inventory[x]
				Global.inventory.clear()
				Global.inventory = tempDic
			else:
				Global.inventory[i]["Count"] -= 1
			get_node("../InvContainer").fillInventorySlots()
	print(Global.inventory)
