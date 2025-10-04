extends CharacterBody2D

var SPEED: int = 500

func _process(delta: float) -> void:
	var direction: Vector2 = Vector2.ZERO

	if Input.is_action_pressed("ui_left"):
		direction.x = -1
	elif Input.is_action_pressed("ui_right"):
		direction.x = 1

	move_and_collide(direction * SPEED * delta)

func collect(collectible_type: String) -> void:
	print("Collected: " + collectible_type)
