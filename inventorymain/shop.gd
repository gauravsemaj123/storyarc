extends Control

signal closeDialog

var is_shop_open: bool = false

var currItem = 0
var select = 0
var item = null

@onready var prev: Button = $Control/Prev
@onready var next: Button = $Control/Next

var randomizer = 0

func _ready() -> void:
	showitem()
	randomShopDialog()
	close()
	
func randomShopDialog():
	randomizer = randi_range(0, 2)

func _process(delta: float) -> void:
	if currItem == 0:
		prev.visible = false
	elif currItem == 1 || currItem != (int(Global.shop.size()) - 1):
		prev.visible = true
		next.visible = true
	else:
		next.visible = false
	
func showitem():
	get_node("Control/Item").texture = Global.shop[0]["Icon"]
	get_node("Control/Name").text = Global.shop[0]["Name"]
	get_node("Control/Des").text = Global.shop[0]["Des"]
	get_node("Control/Cost").text = "HALAGA NG BILIHIN: " + str(Global.shop[0]["Cost"])
	
func open():
	visible = true

func close():
	visible = false

func _on_close_pressed():
	closeDialog.emit()
	close()
	

func switchItem(select):
	for i in range(Global.shop.size()):
		if select == i:
			currItem = select
			get_node("Control/Item").texture = Global.shop[currItem]["Icon"]
			get_node("Control/Name").text = Global.shop[currItem]["Name"]
			get_node("Control/Des").text = Global.shop[currItem]["Des"]
			get_node("Control/Cost").text = "HALAGA NG BILIHIN: " + str(Global.shop[currItem]["Cost"])
			get_node("Control/Say").text = str(Global.valerie_shopDialog[randomizer]["say"])
			
func _on_next_pressed():
	switchItem(currItem+1)
	randomShopDialog()

func _on_prev_pressed():
	switchItem(currItem-1)
	randomShopDialog()

	
func _on_buy_pressed():
#	ADD ITEM
	var hasItem = false
	if Global.gold > Global.shop[currItem]["Cost"]:
		for i in Global.inventory:
			if Global.inventory[i]["Name"] == Global.shop[currItem]["Name"]:
				Global.inventory[i]["Count"] += 1
				hasItem = true
		if hasItem == false:
			var tempDic = Global.shop[currItem]
			tempDic["Count"] = 1
			Global.inventory[Global.inventory.size()] = tempDic
		get_node("Control/Say").text = "Maraming Salamat!"
		Global.gold -= Global.shop[currItem]["Cost"]
	
	else:
		get_node("Control/Say").text = "Naku, anak! wala kang pera!"
	print(Global.inventory)
