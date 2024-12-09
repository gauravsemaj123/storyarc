extends Node2D

@onready var typing: AnimationPlayer = $typing
@onready var questionpanel: RichTextLabel = $minigameui/main/questionpanel
@onready var resultpanel: RichTextLabel = $minigameui/main/resultpanel

@onready var a: Button = $minigameui/main/ANSWERPANEL/VBOX/A
@onready var b: Button = $minigameui/main/ANSWERPANEL/VBOX/B
@onready var c: Button = $minigameui/main/ANSWERPANEL/VBOX2/C
@onready var d: Button = $minigameui/main/ANSWERPANEL/VBOX2/D

@onready var answerpanel: HBoxContainer = $minigameui/main/ANSWERPANEL
@onready var totalanswer: LineEdit = $minigameui/main/totalanswer

var visible_chars = 0
var questionsequence = 0

@onready var dialog: AudioStreamPlayer2D = $dialog
@onready var ina: AudioStreamPlayer2D = $in

signal done
signal doneanswering
signal donecompute

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("mouseLeft"):
		if typing.is_playing():
			typing.play("SKIP")
		else:
			done.emit()
	if event.is_action_pressed("accept") and questionsequence == 4:
		donecompute.emit()
		Global.compute = int(totalanswer.text)
		resultpanel.text += "============" + "\n" + "KABUUAN: " + totalanswer.text

func _process(delta: float) -> void:
	if visible_chars != questionpanel.visible_characters:
		visible_chars = questionpanel.visible_characters
		dialog.pitch_scale = randf_range(.5, .8)
		dialog.play()

func _ready() -> void:
	begintest()
	resultpanel.text = ""
	totalanswer.visible = false
	
func begintest():
	questionpanel.text = "Ito ay para masubukan na'tin ang iyong kaalaman! Ikaw mismo ang magdidikta kung magkano lahat ng aabutin ng gastusin sa handa ni Mat Mat!"
	typing.play("typebegin")
	await typing.animation_finished
	await done
	typing.play("RESET")
	await get_tree().create_timer(.5).timeout
	initialize_question()

func buttons():
	if questionsequence == 0:
		a.text = "90" 
		b.text = "60" 
		c.text = "45" 
		d.text = "100"
	if questionsequence == 1:
		a.text = "90" 
		b.text = "35" 
		c.text = "45" 
		d.text = "55"
	if questionsequence == 2:
		a.text = "8" 
		b.text = "20" 
		c.text = "15" 
		d.text = "10"
	if questionsequence == 3:
		a.text = "24" 
		b.text = "16" 
		c.text = "32" 
		d.text = "18"

func evaluate():
	questionpanel.text = "Mhmm, sige, eto ang susunod; anak!"
	typing.play("typebegin")
	await typing.animation_finished
	await done
	typing.play("RESET")
	await get_tree().create_timer(.5).timeout
	initialize_question()

func verdict():
	totalanswer.visible = false
	questionpanel.text = ""
	if int(totalanswer.text) == 168:
		questionpanel.text = "Ang aktwal na kabuuan ay 168 para mabili lahat ng pangangailangan sa handa."
		typing.play("typebegin")
		await typing.animation_finished
		await done
		typing.play("RESET")
		await get_tree().create_timer(.5).timeout
		questionpanel.text = "Tiyak na napakagaling mo talaga sa matematika, Lisa! Hanga ako sa'yo! O s'ya, Isusulat ko rito na ang kabuuang gastusin ay 168, anak!"
		typing.play("typebegin")
		await typing.animation_finished
		await done
		typing.play("RESET")
	else:
		questionpanel.text = "Sa tingin ko anak, mali ka ng pagkukuwenta. Hindi ko alam kung saan ka nagkamali, pero sa tingin ko ay dapat maisaayos na'tin 'yan. Ayos lang naman anak na magkamali!"
		typing.play("typebegin")
		await typing.animation_finished
		await done
		typing.play("RESET")
		await get_tree().create_timer(.5).timeout
		questionpanel.text = "Pero ang tamang kabuuan ay 168. Isusulat ko na lamang para hindi masira ang handaan sa kaarawan ni MatMat upang hindi siya malungkot. Maraming salamat din anak sa iyong pagsubok pa rin sa hamon ng talas ng isip!"
		typing.play("typebegin")
		await typing.animation_finished
		await done
		typing.play("RESET")
	Global.compute = 168
	Questlines.updateQuest()
	NavigationManager.go_to_level("villagespring", "ins_vil")

func initialize_question():
	print(questionsequence)
	answerpanel.visible = true
	if questionsequence <= 3:
		questionpanel.text = MinigameResources.computingMinigame[questionsequence]["question"]
		typing.play("typebegin")
		buttons()
	else:
		answerpanel.visible = false
		typing.play("totalprice")
		await typing.animation_finished
		thetext()

	await doneanswering
	if questionsequence <= 3:
		questionsequence += 1
		evaluate()

func thetext():
	questionpanel.text = "Magkano lahat sa tingin mo ang aabutin na makikita mo sa nakalista sa bandang kaliwa?"
	typing.play("typebegin")
	totalanswer.visible = true
	await donecompute
	typing.play("RESET")
	verdict()

func _on_a_pressed() -> void:
	answerpanel.visible = false
	resultpanel.text += "• " + a.text + "\n"
	ina.play()
	doneanswering.emit()

func _on_b_pressed() -> void:
	answerpanel.visible = false
	resultpanel.text += "• " + b.text + "\n"
	ina.play()
	doneanswering.emit()

func _on_c_pressed() -> void:
	answerpanel.visible = false
	resultpanel.text += "• " + c.text + "\n"
	ina.play()
	doneanswering.emit()

func _on_d_pressed() -> void:
	answerpanel.visible = false
	resultpanel.text += "• " + d.text + "\n"
	ina.play()
	doneanswering.emit()
