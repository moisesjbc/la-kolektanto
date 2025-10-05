extends CharacterBody2D

var SPEED: int = 500
var current_collectibles_quantity: int = 0
var current_collectibles_type: String = '???'
var current_collectibles_money: int = 0
var current_money: int = 0
signal collectibles_updated(quantity: int, type: String, money: int)
signal money_updated(money: int)

func _process(delta: float) -> void:
	var direction: Vector2 = Vector2.ZERO

	if Input.is_action_pressed("ui_left") or get_parent().get_node("gui").left_button_pressed():
		direction.x = -1
	elif Input.is_action_pressed("ui_right") or get_parent().get_node("gui").right_button_pressed():
		direction.x = 1
		
	if Input.is_action_just_pressed("ui_sell") and current_collectibles_quantity > 0:
		sell_collectibles()

	var collision: KinematicCollision2D = move_and_collide(direction * SPEED * delta)
	if collision and collision.get_collider().is_in_group("collectibles"):
		collect(collision.get_collider())
		collision.get_collider().queue_free()

func collect(collectible: Node) -> void:
	if collectible.TYPE == current_collectibles_type:
		current_collectibles_quantity += 1
		current_collectibles_money += current_collectibles_quantity + collectible.extra_money
	else:
		current_collectibles_quantity = 1
		current_collectibles_money = 1 + collectible.extra_money

	current_collectibles_type = collectible.TYPE
	
	emit_signal("collectibles_updated", current_collectibles_quantity, current_collectibles_type, current_collectibles_money)
	$collect.play()

func sell_collectibles() -> void:
	if current_collectibles_quantity > 0:
		current_money += current_collectibles_money
		
		current_collectibles_quantity = 0
		current_collectibles_type = '???'
		current_collectibles_money = 0
		
		emit_signal("money_updated", current_money)
		emit_signal("collectibles_updated", current_collectibles_quantity, current_collectibles_type, current_collectibles_money)
		$sell.play()


func _on_gui_sell_button_pressed() -> void:
	sell_collectibles()
