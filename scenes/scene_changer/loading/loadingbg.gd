extends ParallaxLayer

var speed = -.5

func _process(_delta) -> void:
	self.motion_offset.x += speed
