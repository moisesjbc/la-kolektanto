extends Node2D

var collectible_scene: PackedScene = preload("res://gameplay/collectible/collectible.tscn")
@onready var position_range: int = $right_pos.global_position.x - $left_pos.global_position.x


func _on_timer_timeout() -> void:
	respawn_collectible()

func respawn_collectible():
	var collectible: Node2D = collectible_scene.instantiate()

	randomize()
	collectible.global_position = Vector2(
		randi() % position_range + $left_pos.global_position.x,
		global_position.y
	)

	$collectibles.add_child(collectible)
