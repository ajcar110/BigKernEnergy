extends Area2D

@export var throw_node : NodePath

@onready var throw_state = get_node(throw_node)

func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_entered(area):
	if area.name == "Hurtbox":
		var enemy = area.get_parent()
		var enemyHP= enemy.hp
		var scene = PackedScene.new()
		scene.pack(enemy)
		throw_state.Projectile = scene
		throw_state.throwhp = enemyHP
		enemy.queue_free()
