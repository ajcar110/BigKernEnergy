extends BaseState


# Called when the node enters the scene tree for the first time.
func _ready():
	player.damagable.connect("on_hit", _on_damagable_hit)
	
	
func _on_damagable_hit():
	pass
