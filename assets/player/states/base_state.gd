class_name BaseState
extends Node

@export var animation_name:String

signal interupt_state(new_state : BaseState)

# Pass in a reference to the player's kinematic body so that it can be used by the state
var player: CharacterBody2D

func enter() -> void:
	player.animations.play(animation_name)

func exit() -> void:
	pass

func input(event: InputEvent) -> BaseState:
	return null

func process(delta: float) -> BaseState:
	return null

func physics_process(delta: float) -> BaseState:
	return null
