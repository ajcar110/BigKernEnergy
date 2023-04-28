extends BaseState
@export var next_attack_node:NodePath
@export var idle_node:NodePath


@onready var next_attack_state: BaseState = get_node(next_attack_node)
@onready var idle_state: BaseState = get_node(idle_node)

var attack_pressed = false


func enter(_msg := {}) -> void:
	player.animations.play(animation_name)
	player.can_attack = false
	attack_pressed = false


func input(event: InputEvent) -> BaseState:
	# First run parent code and make sure we don't need to exit early
	# based on its logic
	var new_state = super.input(event)
	if new_state:
		return new_state
	
	if Input.is_action_just_pressed("attack"):
		attack_pressed = true

	return null

func process(delta):
	if !player.animations.is_playing():
		return idle_state
	if player.can_attack and attack_pressed:
		print("why")
		return next_attack_state
