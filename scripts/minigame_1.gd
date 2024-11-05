extends Node2D

@onready var line_edit: LineEdit = $MINIGAMEUI/LineEdit
@onready var timerlang: AnimationPlayer = $MINIGAMEUI/timerbar/timerlang
@onready var indicator: Label = $MINIGAMEUI/timerbar/indicator
@onready var timer: Timer = $MINIGAMEUI/timerbar/Timer
@onready var riddle: RichTextLabel = $MINIGAMEUI/riddle
@onready var dialog: AudioStreamPlayer2D = $MINIGAMEUI/dialog
@onready var checkboxes: HBoxContainer = $MINIGAMEUI/checkboxes

var check: int = 0
var is_indialog: bool = false
var visible_characters = 0
var question_number: int
var totalscore: int = 10
# Called when the node enters the scene tree for the first time.

func _ready() -> void:
	question_number = 0
	line_edit.visible = false
	riddle.text = "Simulan na na'tin anak!"
	timerlang.play("riddletype")
	await timerlang.animation_finished
	line_edit.visible = true
	ready_question()
	
func _process(delta: float) -> void:
	update_timer_text()
	if visible_characters != riddle.visible_characters:
		visible_characters = riddle.visible_characters
		dialog.play()
		

func checkbox_anim():
	var tracker = "checkslot" + str(check)
	if check == 0:
		checkboxes.find_child("checkslot").correctAnim()
	else:
		checkboxes.find_child(tracker).correctAnim()

func wrongbox_anim():
	var tracker = "checkslot" + str(check + 1)
	if check == 0:
		checkboxes.find_child("checkslot").wrongAnim()
	else:
		checkboxes.find_child(tracker).wrongAnim()

func update_timer_text():
	indicator.text = str(ceil(timer.time_left))
	
func ready_question():
	is_indialog = false
	question_number += 1
	riddle.text = "BUGTONG, BUGTONG: " + str(MinigameResources.riddleMinigame[question_number]["question"]) + " Ano ito?"
	timer.paused = false
	countdown()

func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("accept") and line_edit.text != null:
		evaluate_answer()
		
func countdown():
	timer.start()
	timerlang.play("decrease")
	await timerlang.animation_finished
	timer.stop()
	timeout()

func timeout():
	if !is_indialog:
		is_indialog = true
		DialogueManager.show_example_dialogue_balloon(load("res://scenes/dialogues/eyre.dialogue"), "outoftime")
		wrongbox_anim()
		line_edit.clear()
		timer.paused = true
		timerlang.pause()
		await DialogueManager.dialogue_ended
		timerlang.play("RESET")
		if totalscore > 0:
			totalscore -= 1
		if question_number < 10:
			check += 1
			ready_question()
		else:
			pass

func evaluate_answer():
	if !is_indialog:
		is_indialog = true
		if str(line_edit.text).to_lower() == str(MinigameResources.riddleMinigame[question_number]["answer"]).to_lower():
			checkbox_anim()
			DialogueManager.show_example_dialogue_balloon(load("res://scenes/dialogues/eyre.dialogue"), "correct")
			line_edit.clear()
			timer.paused = true
			timerlang.pause()
			await DialogueManager.dialogue_ended
			timerlang.play("RESET")
			if question_number < 10:
				check += 1
				ready_question()
			else:
				pass
		else:
			DialogueManager.show_example_dialogue_balloon(load("res://scenes/dialogues/eyre.dialogue"), "wrong")
			wrongbox_anim()
			line_edit.clear()
			timer.paused = true
			timerlang.pause()
			await DialogueManager.dialogue_ended
			timerlang.play("RESET")
			if totalscore > 0:
				totalscore -= 1
			if question_number < 9:
				check += 1
				ready_question()
			else:
				pass
	else:
		pass
