class_name Damagable
extends Node


@export var MaxHealth : int = 30
var health :float = MaxHealth





func hit(damage):
	health-= damage
	
	if health <= 0:
		get_parent().queue_free()
