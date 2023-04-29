extends BaseState

@export var throw_small_node: NodePath

@onready var throw_small_state :BaseState = get_node(throw_small_node)

var throw_state
func enter():
	super.enter()
	player.holding = true
	throw_state = throw_small_state

func process(delta):
	if !player.animations.is_playing():
		print(throw_state.Projectile)
		return throw_state
