extends Node

var started: bool = false
var lives: int = 3

var points: int = 0
var record: int = 0

var current_level = 1
var total_levels = 3

signal on_powerup # sinal para ativar power up

func _add_points(value):
	points += value
	
func _reset_points():
	points = 0
	
func _update_record():
	if points > record:
		record = points

func _reset_lives():
	lives = 3

func change_level():
	if current_level < total_levels:
		current_level += 1
		var scene_directory = "res://Scenes/level_" + str(current_level) + ".tscn"
		get_tree().change_scene_to_file(scene_directory)
	else:
		print("Vc venceu o jogo!")	
		goto_game_end_scene()

func goto_game_end_scene():
	started = false
	var scene_directory = "res://Scenes/winner.tscn"
	get_tree().change_scene_to_file(scene_directory)

func reset_game():
	_reset_lives()
	_reset_points()
	current_level = 0
	change_level()
