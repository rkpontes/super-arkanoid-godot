extends Node2D

@onready var timer_reset = $TimerReset
@onready var audio_death: AudioStreamPlayer2D = $AudioDeath

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("next_level_test"):
		GameManager.started = false
		GameManager.change_level()

func _on_death_zone_body_entered(body: Node2D) -> void:
	
	if body.name == "Ball":
		audio_death.play()
		
		if GameManager.lives > 1:
			GameManager.lives -= 1
			body.reset_position()
		else:
			GameManager.lives = 0
			GameManager._update_record() # Atualiza record
			timer_reset.start()
	else:
		body.queue_free()

func _on_timer_reset_timeout() -> void:
	GameManager._reset_lives()
	GameManager._reset_points()
	GameManager.started = false
	GameManager.current_level = 0 
	GameManager.change_level()
