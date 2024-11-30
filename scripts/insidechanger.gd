extends Area2D

func changeLayer():
	if Weather.layer == 0:
		print("rainlayer: " + str(Weather.layer))
		Weather.layer = -1
	elif Weather.layer == -1:
		print("rainlayer: " + str(Weather.layer))
		Weather.layer = 0

func _on_body_entered(body: Node2D) -> void:
	changeLayer()
