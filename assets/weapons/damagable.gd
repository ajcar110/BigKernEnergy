class_name Damagable
extends Node


@export var MaxHealth : int = 30
var health :float = MaxHealth

signal on_hit(node: Node, damage_taken : int, knockback_direction: Vector2 )


func hit(damage: int, knockback_direction: Vector2):
	health-= damage
	
	emit_signal("on_hit",get_parent(), damage, knockback_direction)
	


func _on_animation_player_animation_finished(anim_name):
	if anim_name == "dead":
		get_parent().queue_free()
