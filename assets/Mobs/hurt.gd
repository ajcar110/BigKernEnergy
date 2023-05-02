extends BaseState


@export var dead_node: NodePath
@export var idle_node: NodePath
@export var fall_node: NodePath
@export var states:NodePath

@onready var dead_state = get_node(dead_node)
@onready var idle_state = get_node(idle_node)
@onready var fall_state = get_node(fall_node)
@onready var state_machine = get_node(states)
@onready var damagable = $"../../Damagable"

@export var knockback_velocity = 50

func _ready():
	damagable.connect("on_hit", _on_damagable_hit)

	
func _on_damagable_hit(node: Node, damage_amount: int, knockback_direction:Vector2):
	
	if(damagable.health > 0):
		player.velocity = knockback_velocity * knockback_direction
		player.velocity.y = -knockback_velocity
		player.move_and_slide()
		emit_signal("interupt_state", self)
	elif(damagable.health < damagable.MaxHealth/2 && damagable.health > 0):
		player.Grabable = true
	else:
		emit_signal("interupt_state", dead_state)


func process(delta):
	if !player.animations.is_playing():
		if player.is_on_floor():
			return idle_state
		else:
			return fall_state
