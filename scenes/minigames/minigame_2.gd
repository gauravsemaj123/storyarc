extends CanvasLayer
@onready var spin_1: Button = $"MINIGAME ELEMENTS/spin1"
@onready var spin_2: Button = $"MINIGAME ELEMENTS/spin2"
@onready var spin_3: Button = $"MINIGAME ELEMENTS/spin3"

@onready var spin: AnimationPlayer = $"MINIGAME ELEMENTS/spin"

@onready var wheel_1: Node2D = $"MINIGAME ELEMENTS/spin1/wheel1"
@onready var wheel_2: Node2D = $"MINIGAME ELEMENTS/spin2/wheel2"
@onready var wheel_3: Node2D = $"MINIGAME ELEMENTS/spin3/wheel3"

@onready var signalizer: Light1 = $"MINIGAME ELEMENTS/signalizer"
@onready var signalizer_2: Light2 = $"MINIGAME ELEMENTS/signalizer2"
@onready var signalizer_3: Light3 = $"MINIGAME ELEMENTS/signalizer3"

@onready var chestopen: AudioStreamPlayer2D = $"MINIGAME ELEMENTS/chestopen"

signal doneminigame

var progress: int = 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	spin.play("RESET2")
	spin.play("RESET3")

func _on_button_pressed() -> void:
	print("nigar")
	spin.play("RESET")
	spin.play("RESET2")
	spin.play("RESET3")
	spin_1.wheelsequence = 1
	spin_2.wheelsequence = 1
	spin_3.wheelsequence = 1

func opencheck():
	
	if signalizer.signal1unlock == true and signalizer_2.signal2unlock == true and signalizer_3.signal3unlock == true:
		progress = 1
	print(progress)
	
	if progress == 1:
		chestopen.play()
		spin.play("fadeout")
		await spin.animation_finished
		visible = false
		doneminigame.emit()
	
func _on_spin_1_pressed() -> void:
	spin_1.beginspinning()
	await spin.animation_finished
	opencheck()

func _on_spin_2_pressed() -> void:
	spin_2.beginspinning2()
	await spin.animation_finished
	opencheck()
	
func _on_spin_3_pressed() -> void:
	spin_3.beginspinning3()
	await spin.animation_finished
	opencheck()
