extends CharacterBody2D

var SPEED: int = 500

func _process(delta: float) -> void:
	var direction: Vector2 = Vector2.ZERO

	if Input.is_action_pressed("ui_left"):
		direction.x = -1
	elif Input.is_action_pressed("ui_right"):
		direction.x = 1

	var collision: KinematicCollision2D = move_and_collide(direction * SPEED * delta)
	if collision and collision.get_collider().is_in_group("collectibles"):
		collect(collision.get_collider().TYPE)
		collision.get_collider().queue_free()

func collect(collectible_type: String) -> void:
	print("Collected: " + collectible_type)
