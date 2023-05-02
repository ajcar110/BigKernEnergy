extends CharacterBody2D


@export var throw_speed: float = .4
@export var throw_timer : Timer
@export var bounce: float = 200

var kern
var is_returning = false
var throw_target
var return_target
signal returned

func _ready():
	kern = get_parent().get_node("player")
	throw_target = kern.throw_target.global_position

func _physics_process(delta):
	if !is_returning:
		position = lerp(global_position,throw_target,throw_speed)
		
		if position == throw_target && throw_timer.is_stopped():
			throw_timer.start()

	else:
		position = lerp(global_position, kern.grab_point.global_position,.75)
		if position.distance_to(kern.grab_point.global_position) <= 2:
			queue_free()
			emit_signal("returned")

func _on_return_timer_timeout():
	is_returning = true



func _on_area_2d_body_entered(body):
	if body.name == "player" && !is_returning:
		print("ding")
		body.velocity.y -= bounce
		emit_signal("returned")
		queue_free()
