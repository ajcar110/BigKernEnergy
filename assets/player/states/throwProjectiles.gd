class_name ThrowState
extends BaseState


@export var Projectile: PackedScene
@export var Sfx : AudioStreamPlayer2D
@export var idle_node: NodePath
@export var fall_node: NodePath
@export var walk_node: NodePath
@export var run_node: NodePath

@onready var idle_state= get_node(idle_node)
@onready var fall_state= get_node(fall_node)
@onready var walk_state= get_node(walk_node)
@onready var run_state= get_node(run_node)

var throwhp = 0

func throw():
	player.throwhp = throwhp
	player.throw(Projectile)
	print("throwstate val" + str(throwhp))

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
	return null

func exit():
	throwhp = 0
