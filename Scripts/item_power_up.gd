extends CharacterBody2D

@export var fall_speed = 80 # veloc queda
@export var rotation_speed = 60 # veloc rotaçao

func _physics_process(delta: float) -> void:
	# aplicar velocidade no eixo vertical e incrementar a rotaçao
	velocity.y = fall_speed
	rotation_degrees += rotation_speed * delta
	
	var collision = move_and_collide(velocity * delta)
	
	if collision != null :
		var collision_object = collision.get_collider()
		if "Player" in collision_object.name:
			GameManager.on_powerup.emit()
			queue_free()
			
	
	
