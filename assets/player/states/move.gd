class_name MoveState
extends BaseState

@export var move_speed: float = 60
@export var jump_node:NodePath 
@export var fall_node:NodePath
@export var roll_node:NodePath
@export var idle_node:NodePath
@export var walk_node:NodePath
@export var run_node:NodePath
@export var attack1_node:NodePath


@onready var jump_state: BaseState = get_node(jump_node)
@onready var fall_state: BaseState = get_node(fall_node)
@onready var idle_state: BaseState = get_node(idle_node)
@onready var roll_state: BaseState = get_node(roll_node)
@onready var walk_state: BaseState = get_node(walk_node)
@onready var run_state: BaseState = get_node(run_node)
@onready var attack1_state: BaseState = get_node(attack1_node)

func input(event: InputEvent) -> BaseState:
	if Input.is_action_just_pressed("jump"):
		return jump_state
	
	if Input.is_action_just_pressed("roll"):
		return roll_state
	
	if Input.is_action_just_pressed("attack"):
		return attack1_state

	return null

func physics_process(delta: float) -> BaseState:
	if !player.is_on_floor():
		return fall_state

	var move = get_movement_input()
	if move < 0:
		player.flip.scale.x = -1
	elif move > 0:
		player.flip.scale.x = 1
	
	player.velocity.y += player.gravity
	player.velocity.x = move * move_speed
	player.set_velocity(player.velocity)
	player.set_up_direction(Vector2.UP)
	player.move_and_slide()
	player.velocity = player.velocity
	
	if move == 0:
		return idle_state

	return null

func get_movement_input() -> int:
	if Input.is_action_pressed("move_left"):
		return -1
	elif Input.is_action_pressed("move_right"):
		return 1
	
	return 0
