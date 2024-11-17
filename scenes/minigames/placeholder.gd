extends TextureRect

@export var placeholder_slot: int = 0

var property: Dictionary = {	"TEXTURE": texture,
								"PLACEHOLDER_TYPE": placeholder_slot}:
	set(value):
		property = value
		
		texture = property["TEXTURE"]
		placeholder_slot = int(property["PLACEHOLDER_TYPE"])
