extends BaseState
@export var next_attack_node:NodePath
@export var idle_node:NodePath
@export var jump_node:NodePath
@export var fall_node:NodePath
@export var run_node: NodePath
@export var walk_node: NodePath
@export var roll_node:NodePath
@export var hitbox_node:NodePath

@onready var jump_state: BaseState = get_node(jump_node)
@onready var fall_state: BaseState = get_node(fall_node)
@onready var walk_state: BaseState = get_node(walk_node)
@onready var run_state: BaseState = get_node(run_node)
@onready var roll_state: BaseState = get_node(roll_node)
@onready var next_attack_state: BaseState = get_node(next_attack_node)
@onready var idle_state: BaseState = get_node(idle_node)
@onready var hitbox: Area2D = get_node(hitbox_node)

var attack_pressed = false


func enter(_msg := {}) -> void:
	player.animations.play(animation_name)
	player.can_attack = false
	attack_pressed = false


func input(event: InputEvent) -> BaseState:
	# First run parent code and make sure we don't need to exit early
	# based on its logic
	var new_state = super.input(event)
	if new_state:
		return new_state
	if Input.is_action_just_pressed("jump"):
		return jump_state
	if Input.is_action_just_pressed("roll"):
		return roll_state
	
	if Input.is_action_just_pressed("attack"):
		attack_pressed = true

	return null

func process(delta):
	var move = 0
	if Input.is_action_pressed("move_left"):
		move = -1
		player.flip.scale.x = -1
	elif Input.is_action_pressed("move_right"):
		move = 1
		player.flip.scale.x = 1
	if !player.animations.is_playing():
		if player.is_on_floor():
			if move != 0:
				if Input.is_action_pressed("run"):
					return run_state
				return walk_state
			else:
				return idle_state
	if player.can_attack and attack_pressed:
		return next_attack_state

func exit():
	hitbox.monitoring = false
