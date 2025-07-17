extends StaticBody2D

@export var lives_block = 1
@onready var sprite_node = get_node("Sprite2D")

func _take_damage() -> bool:
	lives_block -= 1
	if lives_block <= 0:
		get_parent().get_parent().call_deferred("check_if_blocks_exists")
		get_parent().remove_child(self)
		queue_free()
		return true
	else:
		_on_damage_received()
		return false
		

func _on_damage_received():
	sprite_node.modulate = Color(0.75, 0.75, 0.75, 1)
