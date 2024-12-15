extends Control

@onready var slide: AnimationPlayer = $slide
@onready var message: Label = $bg/message


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Notifier.goldnotify.connect(showNotifGold)
	Notifier.newquest.connect(showNotifQuest)
	Notifier.newitem.connect(showItemNew)
	Notifier.customnotification.connect(customNotif)

func customNotif(custom):
	message.text = custom
	slide.play("slide")
	await get_tree().create_timer(4).timeout
	slide.play_backwards("slide")

func showNotifGold(gold):
	message.text = "Nadagdagan ng " + str(gold) + " ang iyong bulsa!"
	slide.play("slide")
	await get_tree().create_timer(2).timeout
	slide.play_backwards("slide")

@warning_ignore("shadowed_variable_base_class")
func showNotifQuest(name):
	if name == "":
		message.text = "May bago kang gagawin! Hindi na'tin alam kung ano iyon. Pindutin ang [I] para makita ang detalye"
		slide.play("slide")
		await get_tree().create_timer(2).timeout
		slide.play_backwards("slide")
	else:
		message.text = "May bago kang gagawin na patungkol kay " + str(name) + "! Pindutin ang [I] para makita ang detalye"
		slide.play("slide")
		await get_tree().create_timer(2).timeout
		slide.play_backwards("slide")

func showItemNew(item):
	message.text = "Nalagay ang " + str(item) + " sa iyong imbentaryo! Pindutin ang [I] nang makita ito!"
	slide.play("slide")
	await get_tree().create_timer(2).timeout
	slide.play_backwards("slide")
