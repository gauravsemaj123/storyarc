extends Node2D

@onready var interaction_area: InteractionArea = $InteractionArea
@onready var player: Player = $"../../sprites/Player"
@onready var inventory: Control = $"../../../UI/Inventory"
var dialog_inprocess: bool = false


var is_wansoy_got: bool = false


func _process(_delta: float) -> void:
	if dialog_inprocess == true:
		inventory.close()
		player.dialogactive = true
	else:
		player.dialogactive = false
	if is_wansoy_got == true:
		InteractionManager.unreg_area(self)
	if Questlines.questline_number != 11:
		position.y = -528
	else:
		position.y = 528
		
func _ready():
	interaction_area.interact = Callable(self, "_on_interact")
	is_wansoy_got = false

func _on_interact():
	if Questlines.questline_number != 11:
		pass
	elif Questlines.questline_number == 11:
		if is_wansoy_got == false:
			inventory.add(17)
			Notifier.newitemAnnounce("Wansoy")
		else:
			pass
		pass
	return
