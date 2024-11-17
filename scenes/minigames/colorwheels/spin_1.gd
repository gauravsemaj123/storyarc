extends Button

var wheelsequence: int = 1
@onready var spin: AnimationPlayer = $"../spin"
@onready var spinclick: AudioStreamPlayer2D = $"../spinclick"

func beginspinning():
	spinclick.play()
	print("wheelcount" + str(wheelsequence))
	if wheelsequence == 1:
		spin.play("wheel1spin1")
	if wheelsequence == 2:
		spin.play("wheel1spin2")
	if wheelsequence == 3:
		spin.play("wheel1spin3")
		await spin.animation_finished
		wheelsequence = 0
		print("reset")
		spin.play("RESET")
	wheelsequence += 1
