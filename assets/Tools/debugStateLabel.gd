extends Label

@export var StateMachine_node: NodePath
@onready var StateMachine = get_node(StateMachine_node)



func _process(delta):
	if StateMachine.current_state== null:
		pass
	else:
		text = StateMachine.current_state.name
