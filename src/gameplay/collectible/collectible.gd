extends CharacterBody2D

var SPEED: float = 500
var DIRECTION: Vector2 = Vector2(0, 1.0)
var TYPE = "coin"
var extra_money = 0

func _ready() -> void:
	randomize()
	var type_index: int = randi() % 2

	if type_index == 0:
		TYPE = "coin"
	else:
		TYPE = "stamp"

	for child in get_children():
		if not child.name.begins_with(TYPE) and child.name != "special":
			child.queue_free()
		else:
			child.visible = true

func _process(delta: float) -> void:
	var collision: KinematicCollision2D = move_and_collide(DIRECTION * SPEED * delta)
	if collision:
		collision.get_collider().collect(self)
		queue_free()

func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()

func set_extra_money(extra_money: int) -> void:
	self.extra_money = extra_money
	$special/extra_label.visible = true
	$special/extra_label.text = "+" + str(extra_money)
