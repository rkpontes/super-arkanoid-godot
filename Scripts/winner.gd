extends Node2D

@onready var label_points: Label = $LabelPoints

func _process(delta: float) -> void:
	label_points.text = "PONTOS: " + str(GameManager.points)


func _on_restart_button_pressed() -> void:
	GameManager.reset_game()
