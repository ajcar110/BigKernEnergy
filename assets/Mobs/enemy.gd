class_name Enemy
extends CharacterBody2D

@export var hitsfx_node:NodePath

@onready var Hitsfx = get_node(hitsfx_node)

func  _ready():
	playHit()


func playHit():
	Hitsfx.play()
