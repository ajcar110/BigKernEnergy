extends TextureProgressBar


@export var Damageable : NodePath

@onready var HP = get_node(Damageable)

func _process(delta):
	value = (HP.health/HP.MaxHealth)*100
