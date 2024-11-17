extends Sprite2D
class_name Light1

const empty = preload("res://ui/misc/minigames/empty.png")
const green = preload("res://ui/misc/minigames/green.png")
const orange = preload("res://ui/misc/minigames/orange.png")
const violet = preload("res://ui/misc/minigames/violet.png")

var a_is_red: bool = false
var a_is_blue: bool = false
var a_is_yellow: bool = false

var b_is_red: bool = false
var b_is_blue: bool = false
var b_is_yellow: bool = false

var signal1unlock: bool = false

func _process(delta: float) -> void:
	if a_is_red == true and b_is_blue == true:
		texture = violet
		signal1unlock = true
	elif b_is_red == true and a_is_blue == true:
		texture = violet
		signal1unlock = true
	else:
		texture = empty
		signal1unlock = false

func openchestcheck():
	pass

func _on_connect_a_body_entered(body: Node2D) -> void:
	openchestcheck()
	
	if body is Red:
		a_is_red = true
		
	if body is Blue:
		a_is_blue = true
		
	if body is Yellow:
		a_is_yellow = true
		
	print("a"+str(a_is_red))
	print("a"+str(a_is_blue))
	print("a"+str(a_is_yellow))


func _on_connect_a_body_exited(body: Node2D) -> void:
	if a_is_red:
		a_is_red = false
	if a_is_blue:
		a_is_blue = false
	if a_is_yellow:
		a_is_yellow = false


func _on_connect_b_body_entered(body: Node2D) -> void:

	if body is Red:
		b_is_red = true
		
	if body is Blue:
		b_is_blue = true
		
	if body is Yellow:
		b_is_yellow = true
		
	print("b"+str(b_is_red))
	print("b"+str(b_is_blue))
	print("b"+str(b_is_yellow))
func _on_connect_b_body_exited(body: Node2D) -> void:
	if b_is_red:
		b_is_red = false
	if b_is_blue:
		b_is_blue = false
	if b_is_yellow:
		b_is_yellow = false
