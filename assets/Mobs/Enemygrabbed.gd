extends BaseState

@export var thrown_state_node: NodePath

@onready var thrown_state = get_node(thrown_state_node)
@onready var damagable = $"../../Damagable"

var grab_point:Node

func _ready():
	damagable.connect("on_grabbed", _on_character_grabbed)
	damagable.connect("on_thrown", _on_character_thrown)



func _on_character_grabbed(position: Node):
	grab_point = position
	emit_signal("interupt_state",self)



func _on_character_thrown(position: Node):
	grab_point = position
	emit_signal("interupt_state", thrown_state)


func enter():
	super.enter()
	player.global_position = grab_point.global_position



func physics_process(delta):
	player.global_position = grab_point.global_position
