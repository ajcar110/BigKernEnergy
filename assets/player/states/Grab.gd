extends BaseState

@export var throw_node: NodePath

@onready var throwing_state :BaseState = get_node(throw_node)

var throw_state
func enter():
	super.enter()
	player.holding = true
	throw_state = throwing_state

func process(delta):
	if !player.animations.is_playing():
		return throw_state
