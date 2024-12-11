extends Node2D

@onready var streamplayer: AudioStreamPlayer2D = $streamplayer
@onready var musicplayer: AudioStreamPlayer2D = $musicplayer
@onready var waterplayer: AudioStreamPlayer2D = $waterplayer

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

#Music Library
#Code Goes here....

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
	if audiofile == "stop":
		musicplayer.stop()
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
	musicplayer.stream = streamfile
	musicplayer.play()
	
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
