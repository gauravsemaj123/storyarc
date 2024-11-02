extends ParallaxLayer

var speed = -.1

func _process(_delta) -> void:
	self.motion_offset.x += speed
