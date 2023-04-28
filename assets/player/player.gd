class_name Player
extends CharacterBody2D

var gravity = 4
var can_attack:bool = true


@onready var animations = $AnimationPlayer
@onready var flip = $Flip
@onready var states = $state_manager

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

func ready_to_attack():
	can_attack = true
