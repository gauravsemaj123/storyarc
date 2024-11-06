class_name Player extends CharacterBody2D
@onready var spriteanims = $AnimatedSprite2D
const SPEED = 300.0
const SWIM_SPEED = 250.0
const JUMP_VELOCITY = -400.0
const SWIM_JUMP = -250
@export var SWIM_FACTOR: float = 0.50
var paused = false
var uiactive = false
var dialogactive = false
var inventoryactive = false
@onready var body = $body
@onready var camera_2d = $Camera2D
#@onready var sfx: AudioStreamPlayer2D = $SFX
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
@onready var splash: AnimatedSprite2D = $splash

var is_in_water: bool = false

@export var currscene = NavigationManager.currentscene


func _ready():
	NavigationManager.on_trigger_player_spawn.connect(_on_spawn)

@warning_ignore("shadowed_variable_base_class", "unused_parameter")
func _on_spawn(position: Vector2, direction: String):
	global_position = position

func on_waterstateChange(is_in_water):
	print("ok")

func _input(event: InputEvent):
	if (event.is_action_pressed("left")):
		body.position.x = -5
	if (event.is_action_pressed("right")):
		body.position.x = 5
	if (event.is_action_pressed("crouch")):
		position.y += 1

func _process(_delta: float) -> void:

	if uiactive == true:
		if dialogactive == true:
			camera_2d.position.y = spriteanims.position.y

		if inventoryactive == true:
			camera_2d.position.x =  400
			camera_2d.position.y = spriteanims.position.y
			spriteanims.flip_h = false
	else:
		camera_2d.position.x = spriteanims.position.x
		camera_2d.position.y = -82

	if (velocity.y > 1):
		if is_in_water:
			spriteanims.animation = "swim"
		else:
			spriteanims.animation = "jump"

	elif (velocity.x > 1 || velocity.x < -1):
		if is_in_water:
			if is_on_floor():
				spriteanims.animation = "walk"
			else:
				spriteanims.animation = "swim"
		else:
			spriteanims.animation = "walk"
	elif is_in_water and not is_on_floor():
		spriteanims.animation = "swim"
	else:
		spriteanims.animation = "idle"

func _unhandled_input(event: InputEvent):
	if (event.is_action_pressed("jump")):
		if is_on_floor():
			pass
			#sfx.play()
	if (event.is_action_pressed("inventory") && inventoryactive == false):
		print(DialogueManager.is_processing())
		if DialogueManager.is_processing():
			print("ui inactive")
			uiactive = true
			inventoryactive = true
		else:
			print("ui activated")
			uiactive = true
			inventoryactive = true
	elif (event.is_action_pressed("inventory") && inventoryactive == true):
		print("ui inactive")
		uiactive = false
		inventoryactive = false
			

func _physics_process(delta):
	
	# Add the gravity.
	if not is_on_floor():
		if !is_in_water:
			velocity.y += gravity * delta
		else:
			velocity.y += gravity * delta * SWIM_FACTOR
	# Handle jump.
	if Input.is_action_just_pressed("jump"):
		if is_on_floor():
			velocity.y = JUMP_VELOCITY
		if is_in_water:
			velocity.y = SWIM_JUMP
		if inventoryactive == true:
			velocity.y = 0
		elif dialogactive == true:
			velocity.y = 0
	#Dynamic front and back shit
	if velocity.x < 0:
		spriteanims.flip_h = true
	elif velocity.x > 0:
		spriteanims.flip_h = false
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("left", "right")
	if direction:
		if is_in_water:
			velocity.x = direction * SWIM_SPEED
		else:
			velocity.x = direction * SPEED
		if inventoryactive == true:
			velocity.x = 0
		elif dialogactive == true:
			velocity.x = 0
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()


func _on_water_detect_water_state_changed(is_in_water):
	self.is_in_water = is_in_water
	print(is_in_water)
