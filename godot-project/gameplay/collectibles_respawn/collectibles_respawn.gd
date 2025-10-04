extends Node2D

var collectible_scene: PackedScene = preload("res://gameplay/collectible/collectible.tscn")
@export var extra_money_probability = 0.2
@export var extra_money = 50
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

	if randf() <= extra_money_probability:
		collectible.set_extra_money(extra_money)

	$collectibles.add_child(collectible)
