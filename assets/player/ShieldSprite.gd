extends Sprite2D

@export var target: NodePath

@onready var target_pos = get_node(target)





func _process(delta):
	global_position = target_pos.global_position
