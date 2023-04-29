class_name Enemy
extends CharacterBody2D

@export var hitsfx_node:NodePath

@onready var Hitsfx = get_node(hitsfx_node)

var gravity: float = 5


func playHit():
	Hitsfx.play()
