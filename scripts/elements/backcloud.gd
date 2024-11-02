extends ParallaxLayer

var cloud_speed = -.2

func _process(_delta) -> void:
	self.motion_offset.x += cloud_speed
