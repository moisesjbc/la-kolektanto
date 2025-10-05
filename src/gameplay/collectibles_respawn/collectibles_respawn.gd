extends Node2D

var collectible_scene: PackedScene = preload("res://gameplay/collectible/collectible.tscn")
@export var extra_money_probability = 0.2
@export var extra_money = 50
@onready var position_range: int = $right_pos.global_position.x - $left_pos.global_position.x
var collectibles_min_speed = 300
var collectibles_max_speed = 330

func _on_respawn_timer_timeout() -> void:
	respawn_collectible()

func respawn_collectible():
	var collectible: Node2D = collectible_scene.instantiate()

	randomize()
	collectible.global_position = Vector2(
		randi() % position_range + $left_pos.global_position.x,
		global_position.y
	)
	
	collectible.SPEED = (randi() % (collectibles_max_speed - collectibles_min_speed)) + collectibles_min_speed

	if randf() <= extra_money_probability:
		collectible.set_extra_money(extra_money)

	$collectibles.add_child(collectible)

func _on_difficulty_timer_timeout() -> void:
	increment_difficulty()
	
func increment_difficulty() -> void:
	collectibles_min_speed += 30
	collectibles_max_speed += 30
