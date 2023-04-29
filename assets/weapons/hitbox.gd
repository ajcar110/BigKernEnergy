extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready():
	monitoring = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_entered(area):
	if area.name == "Hurtbox":
		print("hit " + area.get_parent().name)
		var enemy = area.get_parent()
		enemy.playHit()
