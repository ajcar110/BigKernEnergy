extends Area2D

@export var throw_node : NodePath
@export var grab_point_node: NodePath



@onready var throw_state = get_node(throw_node)
@onready var grab_point = get_node(grab_point_node)


func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_entered(area):
	if area.name == "Hurtbox":
		var enemy = area.get_parent()
		if enemy.damagable.Grabable:
			enemy.damagable.grabbed(grab_point)
#		for child in enemy:
#			if child is Damagable:
#				if child.Grabable:
#					child.grabbed()
