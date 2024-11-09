extends Control

@export var loadingbar: ProgressBar
@export var phrase: Label

var scene_path: String
var progress: Array

var update: float = 0.0

func _ready() -> void:
	scene_path = Loader.scene_path
	ResourceLoader.load_threaded_request(scene_path)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	ResourceLoader.load_threaded_get_status(scene_path, progress)
	
	if progress[0] > update:
		update = progress[0]
	
	if loadingbar.value < update:
		loadingbar.value += lerp(loadingbar.value, update, delta)
	loadingbar.value += delta * 0.2 * \
		(0.5 if update >= 1.0 else clamp(0.9 - loadingbar.value, 0.0, 1.0))

	if loadingbar.value >= 1.0:
		if update >= 1.0:
			get_tree().change_scene_to_packed(
				ResourceLoader.load_threaded_get(scene_path)
			)
	
	
