extends BaseState

@export var jump_force:float = 32
@export var move_speed:float = 100
@export var fall_node:NodePath
@export var run_node:NodePath
@export var walk_node:NodePath
@export var idle_node:NodePath
@export var double_jump_node:NodePath
@export var air_attack_node: NodePath

@onready var fall_state: BaseState = get_node(fall_node)
@onready var double_jump_state: BaseState = get_node(double_jump_node)
@onready var run_state: BaseState = get_node(run_node)
@onready var walk_state: BaseState = get_node(walk_node)
@onready var idle_state: BaseState = get_node(idle_node)
@onready var air_attack_state: BaseState = get_node(air_attack_node)

func enter() -> void:
	# This calls the base class enter function, which is necessary here
	# to make sure the animation switches
	super.enter()
	player.velocity.y = 0
	player.velocity.y = -jump_force
	player.jumps -=1

@warning_ignore("unused_parameter")
func physics_process(delta: float) -> BaseState:
	var move = 0
	if Input.is_action_pressed("move_left"):
		move = -1
		player.flip.scale.x = -1
	elif Input.is_action_pressed("move_right"):
		move = 1
		player.flip.scale.x = 1
	if Input.is_action_just_pressed("attack"):
		return air_attack_state
	player.velocity.x = move * move_speed
	player.velocity.y += player.gravity
	player.set_velocity(player.velocity)
	player.set_up_direction(Vector2.UP)
	player.move_and_slide()
	player.velocity = player.velocity
	
	if player.velocity.y > 0:
		return fall_state

	if player.is_on_floor():
		if move != 0:
			if Input.is_action_pressed("run"):
				return run_state
			return walk_state
		return idle_state
	return null
