extends TextureRect

@onready var checkplay: AnimationPlayer = $checkplay
@onready var wrong: Sprite2D = $wrong
@onready var correct: Sprite2D = $correct

func _ready() -> void:
	wrong.visible = false
	correct.visible = false

func correctAnim():
	checkplay.play("tsek")
	
func wrongAnim():
	checkplay.play("ekis")
