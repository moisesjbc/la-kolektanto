extends CharacterBody2D

var SPEED: float = 1000
var DIRECTION: Vector2 = Vector2(0, 1.0)
var TYPE = "coin"

func _process(delta: float) -> void:
	var collision: KinematicCollision2D = move_and_collide(DIRECTION * SPEED * delta)
	if collision:
		collision.get_collider().collect(TYPE)
		queue_free()

func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()
