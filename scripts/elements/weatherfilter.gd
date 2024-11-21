extends ColorRect
class_name Weatherfilter

@onready var fade: AnimationPlayer = $fade

func _ready() -> void:
	if Weather.is_rainy == false:
		visible = false
	else:
		visible = true

func _process(delta: float) -> void:
	if Weather.is_rainy == true:
		visible = true

func fadeIn():
	visible = true
	fade.play("fade_in")

func permanent():
	fade.play("RESET")
