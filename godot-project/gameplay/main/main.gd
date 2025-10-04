extends Node2D

signal time_elapsed(seconds_left: int)
signal game_over

var seconds_left: int = 2


func _on_countdown_timer_timeout() -> void:
	seconds_left -= 1
	if seconds_left > 0:
		emit_signal("time_elapsed", seconds_left)
	else:
		emit_signal("game_over")
