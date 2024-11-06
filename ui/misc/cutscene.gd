extends CanvasLayer

@onready var cutscenemanage: AnimationPlayer = $cutscenemanage
@onready var moviebarup: ColorRect = $moviebarup
@onready var moviebardn: ColorRect = $moviebardn

signal dialog_begin

func _ready() -> void:
	just_out()
	
func just_out():
	moviebardn.visible = false
	moviebarup.visible = false

func cutscene_begin():
	moviebardn.visible = true
	moviebarup.visible = true
	cutscenemanage.play("cutscene")
	await cutscenemanage.animation_finished
	dialog_begin.emit()
