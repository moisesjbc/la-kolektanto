extends Control


func start() -> void:
	get_tree().paused = true
	visible = true

func restart_game() -> void:
	visible = false
	get_tree().paused = false
	get_tree().reload_current_scene()

func _on_restart_game_button_pressed() -> void:
	restart_game()

func _input(event: InputEvent) -> void:
	if event is InputEventKey and event.keycode == KEY_R:
		restart_game()
