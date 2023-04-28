extends MoveState

@export var roll_time:float = 0.4 

var current_roll_time: float = 0
var roll_direction: int = 0

# Upon entering the state, set roll direction to either current input or the direction the player is facing if no input is pressed
func enter() -> void:
	super.enter()
	
	current_roll_time = roll_time
	
	if player.flip.scale.x == -1:
		roll_direction = -1
	else:
		roll_direction = 1

# Override MoveState input() since we don't want to change states based on player input
func input(event: InputEvent) -> BaseState:
	return null

# Move in the roll_direction every frame
func get_movement_input() -> int:
	return roll_direction

# Track how long we've been rolling so we know when to exit
func process(delta: float) -> BaseState:
	current_roll_time -= delta

	if current_roll_time > 0:
		return null

	if Input.is_action_pressed("move_left") or Input.is_action_pressed("move_right"):
		if Input.is_action_pressed("run"):
			return run_state
		return walk_state
	return idle_state
