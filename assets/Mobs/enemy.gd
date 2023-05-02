class_name Enemy
extends CharacterBody2D

@export var hitsfx_node:NodePath
@export var gravity = 4
@export var Grabable = false

@onready var Hitsfx = get_node(hitsfx_node)
@onready var states = $state_manager
@onready var animations = $AnimationPlayer
@onready var damagable = $Damagable
@onready var hp = damagable.health

var throw_target

func _ready() -> void:
	# Initialize the state machine, passing a reference of the player to the states,
	# that way they can move and react accordingly
	states.init(self)

func _unhandled_input(event: InputEvent) -> void:
	states.input(event)

func _physics_process(delta: float) -> void:
	states.physics_process(delta)

func _process(delta: float) -> void:
	states.process(delta)
	hp= damagable.health



func playHit():
	Hitsfx.play()
