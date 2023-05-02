extends BaseState

@export var fall_node:NodePath
@export var walk_node:NodePath

@onready var fall_state: BaseState = get_node(fall_node)
@onready var walk_state: BaseState = get_node(walk_node)



func physics_process(delta: float) -> BaseState:
	player.velocity.y += player.gravity

	if !player.is_on_floor():
		return fall_state
	
	return null
