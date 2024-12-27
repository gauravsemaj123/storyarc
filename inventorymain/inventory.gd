extends Control
var is_open = false
@onready var button: Button = $Button

func _ready():
	close()

func _input(event: InputEvent):
	if (event.is_action_pressed("inventory")):
		if is_open:
			close()
		else:
			open()

func _process(delta: float) -> void:
	get_node("InvContainer").fillInventorySlots()

func open():
	visible = true
	is_open = true
	get_node("InvContainer").fillInventorySlots()
	get_node("ItemInfo/Title").text = ""
	get_node("ItemInfo/Des").text = "Tignan na'tin kung ano laman!"
	get_node("ItemInfo/Icon").texture = null
	print(str(Global.inventory))
	
func close():
	visible = false
	is_open = false

func add(currItem):
	var hasItem = false
	for i in Global.inventory:
		if Global.inventory[i]["Name"] == Global.items[currItem]["Name"]:
			Global.inventory[i]["Count"] += 1
			hasItem = true
	if hasItem == false:
		var tempDic = Global.items[currItem]
		tempDic["Count"] = 1
		Global.inventory[Global.inventory.size()] = tempDic

func remove(Item):
	for i in Global.inventory:
		if Global.inventory[i]["Name"] ==  Global.items[Item]["Name"]:
			Global.inventory[i]["Count"] -= 1
			if Global.inventory[i]["Count"] == 0:
				#Remove item from inventory, then update the inventory 
				var tempDic = {}
				for x in Global.inventory:
					if x > i:
						tempDic[x-1] = Global.inventory[x]
					elif x < i:
						tempDic[x] = Global.inventory[x]
				Global.inventory.clear()
				Global.inventory = tempDic


func _on_button_pressed() -> void:
	Questlines.updateQuest()
	button.text = "questnumber: " + str(Questlines.questline_number)


func _on_instantiate_pressed() -> void:
	add(0)
	add(11)
	add(12)
	add(2)
	add(3)
	add(16)
	add(17)
	add(4)
	add(5)
	add(6)
	add(14)
	add(15)
	add(7)
	add(8)
	add(1)
	add(9)
	add(10)
	add(13)
	add(18)
	add(21)
	
	pass
