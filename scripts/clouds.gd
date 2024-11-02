extends ParallaxLayer

var cloud_speed = -.5

func _process(_delta) -> void:
	self.motion_offset.x += cloud_speed
