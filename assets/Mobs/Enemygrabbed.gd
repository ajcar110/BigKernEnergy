extends BaseState


@onready var damagable = $"../../Damagable"

var grab_point:Node

func _ready():
	damagable.connect("on_grabbed", _on_character_grabbed)




func _on_character_grabbed(position: Node):
	grab_point = position
	emit_signal("interupt_state",self)


func enter():
	super.enter()
	player.global_position = grab_point.global_position



func physics_process(delta):
	player.global_position = grab_point.global_position
