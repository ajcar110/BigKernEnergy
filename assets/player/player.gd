class_name Player
extends CharacterBody2D

@export var gravity = 4
@export var throw_distance:float = 100
@export var jumps: int = 3
var No_vector: bool
var shield_out:bool = false
var holding: bool = false
var can_attack:bool = true



@onready var HurtBox = $Hurtbox
@onready var animations = $AnimationPlayer
@onready var flip = $Flip
@onready var states = $state_manager
@onready var throw_target = $ThrowTarget
@onready var grab_point = $Flip/GrabPoint

func _ready() -> void:
	# Initialize the state machine, passing a reference of the player to the states,
	# that way they can move and react accordingly
	states.init(self)

func _unhandled_input(event: InputEvent) -> void:
	states.input(event)

func _physics_process(delta: float) -> void:
	states.physics_process(delta)
	aim()

func _process(delta: float) -> void:
	states.process(delta)

func ready_to_attack():
	can_attack = true

func aim():
	var aim_vector := Vector2(
		Input.get_action_strength("aim_right") - Input.get_action_strength("aim_left"),
		Input.get_action_strength("aim_down") - Input.get_action_strength("aim_up")
	)
	
	if aim_vector == Vector2(0,0):
		No_vector = true
	else:
		No_vector = false
		
	if  No_vector:
		aim_vector = Vector2(flip.scale.x,-.25)
	
	
	# Calculate the angle (theta) from the input vector
	var theta :=  atan2(aim_vector.x, -aim_vector.y) - PI/2
	
	# Calculate the position of the object along the circumference of the circle
	var object_position := Vector2(
		throw_distance * cos(theta),
		throw_distance * sin(theta)
	)
	
	# Move the object
	throw_target.position = object_position 


func throw(projectile):
	var p = projectile.instantiate()
	get_parent().add_child(p)
	p.global_position = grab_point.global_position
	if p.name=="Shield":
		shield_out = true
		p.returned.connect(_on_shield_returned)
	
func _on_shield_returned():
	shield_out = false
	print(shield_out)
