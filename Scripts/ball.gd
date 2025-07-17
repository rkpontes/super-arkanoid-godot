extends CharacterBody2D

@export var y_speed = -250
@export var angle = [-200, -250, 250, 300]
@export var drop_probability = 0.2 # probabilidade para gerar item
@export var item_scene = preload("res://Scenes/item_power_up.tscn")
@onready var timer_item_power_up: Timer = $TimerItemPowerUp
@onready var audio_collision: AudioStreamPlayer2D = $AudioCollision

func _physics_process(delta: float) -> void:
	if Input.is_action_pressed("Start") and !GameManager.started:
		play_game()
	
	if GameManager.started:
		var collision = move_and_collide(velocity * delta)
		if collision != null:
			audio_collision.play()
			
			# calcula a visica de rebatida
			velocity = velocity.bounce(collision.get_normal())
			
			# retorna o obj colidido
			var collided_object = collision.get_collider()
			if "Block" in collided_object.name:
				GameManager._add_points(5)
				var destroyed: bool = collided_object._take_damage()
				if destroyed:
					spawn_item(collision.get_position())
		
func play_game():
	GameManager.started = true
	velocity = Vector2(angle.pick_random(), y_speed)
	
func spawn_item(position_item: Vector2):
	# sortear se deve gerar item
	if randf() < drop_probability:
		if timer_item_power_up.is_stopped():
			# criar item
			var item = item_scene.instantiate() # cria instancia de um item
			item.position = position_item
			get_parent().add_child(item) # add item na cena
			timer_item_power_up.start()

func reset_position() -> void:
	var player = get_parent().get_node("Player")
	position = player.position + Vector2(0, -25)
	GameManager.started = false
