extends CharacterBody2D

@onready var Hitsfx =$AudioStreamPlayer

#func _physics_process(delta):
#	velocity= Vector2(0,-1)
#	var collision = move_and_collide(velocity * delta)
#	if collision:
#		var reflect = collision.remainder.bounce(collision)
#		velocity = velocity.bounce(collision.normal)
#		move_and_collide(reflect)

func _on_hurtbox_area_entered(area):
	if area.name == "ShieldHitbox":
		print("bong")
		


func playHit():
	Hitsfx.play()
