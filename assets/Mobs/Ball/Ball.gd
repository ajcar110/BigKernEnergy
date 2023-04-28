extends Area2D

@onready var sfx =$AudioStreamPlayer


func _on_hurtbox_area_entered(area):
	if area.name== "Hitbox":
		sfx.play()
