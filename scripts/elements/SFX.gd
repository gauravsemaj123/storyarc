extends Node2D

@onready var streamplayer: AudioStreamPlayer2D = $streamplayer
@onready var musicplayer: AudioStreamPlayer2D = $musicplayer
@onready var waterplayer: AudioStreamPlayer2D = $waterplayer
@onready var screaming: AudioStreamPlayer2D = $screaming
@onready var graduate: AudioStreamPlayer2D = $graduate

#Sound Effects Library
const idea = preload("res://sounds/SFX/idea.mp3")
const jump = preload("res://sounds/SFX/jump.mp3")
const land = preload("res://sounds/SFX/land.mp3")
const pickup = preload("res://sounds/SFX/pickup.mp3")
const watsplash = preload("res://sounds/SFX/watsplash.mp3")
const paper = preload("res://sounds/SFX/paper.mp3")
const swim_1 = preload("res://sounds/SFX/swim1.mp3")
const swim_2 = preload("res://sounds/SFX/swim2.mp3")
const swim_3 = preload("res://sounds/SFX/swim3.mp3")
const announce = preload("res://sounds/SFX/announce.mp3")
const bum = preload("res://sounds/SFX/bum.mp3")
const solbeam = preload("res://sounds/SFX/solbeam.mp3")
const clonck = preload("res://sounds/SFX/clonck.mp3")
const chestopen = preload("res://ui/misc/minigames/chestopen.mp3")

#Music Library
const cave = preload("res://sounds/OSTs/cave.mp3")
const ruins = preload("res://sounds/OSTs/ruins - scott buckley.mp3")
const convo = preload("res://sounds/OSTs/Should I Start, or Continue.wav")
const village = preload("res://sounds/OSTs/village - anti markkainen.mp3")
const forest = preload("res://sounds/OSTs/forest - infraction.mp3")
const graduation = preload("res://sounds/OSTs/graduation.mp3")
#Code Goes here....

func _ready() -> void:
	streamplayer.volume_db = 9
	musicplayer.volume_db = 7
	waterplayer.volume_db = 8

func sfx(audiofile):
	var streamfile
	match audiofile:
		"idea":
			streamfile = idea
		"jump":
			streamfile = jump
		"land":
			streamfile = land
		"pickup":
			streamfile = pickup
		"watsplash":
			streamfile = watsplash
		"paper":
			streamfile = paper
		"announce":
			streamfile = announce
		"bum":
			streamfile = bum
		"solbeam":
			streamfile = solbeam
		"clonck":
			streamfile = clonck
	streamplayer.stream = streamfile
	streamplayer.play()

func music(audiofile):
	var streamfile
	if audiofile == "pause":
		musicplayer.stream_paused = true
	if audiofile == "stop":
		musicplayer.stop()
	if audiofile == "play":
		musicplayer.stream_paused = false
	match audiofile:
		"cave":
			streamfile = cave
		"ruins":
			streamfile = ruins
		"convo":
			streamfile = convo
		"village":
			streamfile = village
		"forest":
			streamfile = forest
		"graduation":
			streamfile = graduation
	if musicplayer.stream != streamfile:
		musicplayer.stream = streamfile
		startmusic()
	else:
		pass
	
	
	if get_tree().paused == true:
		musicplayer.volume_db = 1.0
	else:
		musicplayer.volume_db = 7

func startmusic():
	musicplayer.play()
	await musicplayer.finished
	repeatit()

func repeatit():
	startmusic()

func swim():
	var waterfile
	var rander = randi_range(1,3)
	if rander == 1:
		waterfile = swim_1
	if rander == 2:
		waterfile = swim_2
	if rander == 3:
		waterfile = swim_3
	waterplayer.stream = waterfile
	waterplayer.play()

func repeatscream():
	startscream()

func startscream():
	screaming.play()
	await screaming.finished
	repeatscream()

func stopstream():
	screaming.stop()

func ending():
	graduate.stream = graduation
	graduate.play()
