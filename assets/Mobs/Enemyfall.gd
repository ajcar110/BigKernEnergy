extends BaseState

@export var idle_node:NodePath

@onready var idle_state = get_node(idle_node)


func physics_process(delta):
	player.velocity.y += player.gravity
	player.set_velocity(player.velocity)
	player.set_up_direction(Vector2.UP)
	player.move_and_slide()
	
	if player.is_on_floor():
		return idle_state
