extends Control

@onready var label_points: Label = $LabelPoints
@onready var label_record: Label = $LabelRecord
@onready var label_lives: Label = $LabelLives


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	label_points.text = "PONTOS: " + str(GameManager.points)
	label_record.text = "RECORDE: " + str(GameManager.record)
	label_lives.text = "VIDAS: " + str(GameManager.lives)
