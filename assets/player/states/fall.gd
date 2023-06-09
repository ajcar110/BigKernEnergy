extends BaseState

@export var move_speed:float = 200
@export var run_node:NodePath
@export var walk_node:NodePath
@export var idle_node:NodePath
@export var double_jump_node:NodePath
@export var air_attack_node: NodePath

@onready var run_state: BaseState = get_node(run_node)
@onready var double_jump_state: BaseState = get_node(double_jump_node)
@onready var walk_state: BaseState = get_node(walk_node)
@onready var idle_state: BaseState = get_node(idle_node)
@onready var air_attack_state: BaseState = get_node(air_attack_node)

func physics_process(delta: float) -> BaseState:
	var move = 0
	if Input.is_action_pressed("move_left"):
		move = -1
		player.flip.scale.x = -1
	elif Input.is_action_pressed("move_right"):
		move = 1
		player.flip.scale.x = 1
	if Input.is_action_just_pressed("jump")&& player.jumps>0:
		return double_jump_state
	if Input.is_action_just_pressed("attack"):
		return air_attack_state
	player.velocity.x = move * move_speed
	player.velocity.y += player.gravity
	player.set_velocity(player.velocity)
	player.set_up_direction(Vector2.UP)
	player.move_and_slide()
	player.velocity = player.velocity

	if player.is_on_floor():
		if move != 0:
			if Input.is_action_pressed("run"):
				return run_state
			return walk_state
		else:
			return idle_state
	return null
