class_name Damagable
extends Node


@export var MaxHealth : int = 30
@export var Grabable = false
var health :float = MaxHealth

signal on_hit(node: Node, damage_taken : int, knockback_direction: Vector2 )
signal on_grabbed(position: Node)
signal on_thrown(position: Node)

func _process(delta):
	if health <= MaxHealth/2:
		Grabable = true

func hit(damage: int, knockback_direction: Vector2):
	health-= damage
	
	emit_signal("on_hit",get_parent(), damage, knockback_direction)
	

func grabbed(position: Node):
	
	emit_signal("on_grabbed", position)

func thrown(position: Node):
	emit_signal("on_thrown", position)


func _on_animation_player_animation_finished(anim_name):
	if anim_name == "dead":
		get_parent().queue_free()
