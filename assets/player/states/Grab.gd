extends BaseState

@export var throw_node: NodePath
@export var idle_node: NodePath

@onready var throwing_state :BaseState = get_node(throw_node)
@onready var idle_state : BaseState = get_node(idle_node)

var throw_state
func enter():
	super.enter()
	throw_state = throwing_state

func process(delta):
	if !player.animations.is_playing() && player.holding:
		return throw_state
	elif !player.animations.is_playing():
		return idle_state
