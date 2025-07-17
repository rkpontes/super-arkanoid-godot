extends Node2D

@onready var audio_level_up: AudioStreamPlayer2D = $AudioLevelUp

func _ready() -> void:
	audio_level_up.play()
	
func check_if_blocks_exists():
	for group in get_children():
		for child in group.get_children():
			if child.name.contains("Block"):
				print("Ainda tem blocos na cena")
				return true
	print("Nenhum bloco na cena")
	goto_next_level()
		

func goto_next_level():
	GameManager.goto_game_end_scene()
