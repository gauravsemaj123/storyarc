extends Node2D

@onready var interaction_area: InteractionArea = $InteractionArea
var dialog_inprocess: bool = false
@onready var player: Player = $"../../sprites/Player"
@onready var inventory: Control = $"../../../UI/Inventory"


var is_mangga_got: bool = false


func _process(_delta: float) -> void:
	if dialog_inprocess == true:
		inventory.close()
		player.dialogactive = true
	else:
		player.dialogactive = false
	if is_mangga_got == true:
		InteractionManager.unreg_area(self)
	if Questlines.questline_number != 11:
		interaction_area.visible = false
func _ready():
	interaction_area.interact = Callable(self, "_on_interact")
	is_mangga_got = false

func _on_interact():
	if Questlines.questline_number != 11:
		pass
	elif Questlines.questline_number == 11:
		if is_mangga_got == false:
			inventory.add(11)
			Notifier.newitemAnnounce("Mangga")
		else:
			pass
		pass
	return
